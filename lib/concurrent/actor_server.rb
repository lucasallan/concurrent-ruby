require 'drb/drb'
require 'concurrent/actor_method_dispatcher'
require 'concurrent/runnable'

module Concurrent

  class ActorServer
    extend Forwardable
    include Runnable
    # Concurrent::Runnable is a mixin I created to provide consistent start/stop
    # behavior for all classes in this library. Just aboutverything in this library
    # that is managed by Supervisor uses Runnable. Runnable provides a couple of
    # callback methods that can be used to inject behavior into the object lifecycle.
    # The most important callback is #on_task which is what is called in the main
    # run loop. It's where we can put the main behavior of the class. Take a look
    # at the Actor class as one example of how Runnable can be used.

    DEFAULT_HOST = 'localhost'
    DEFAULT_PORT = 8787

    def_delegator :@dispatcher, :add

    def initialize(host = DEFAULT_HOST, port = DEFAULT_PORT)
      # This is a Rubyism I always struggle with, but I don't have strong feelings
      # about it so I can go either way. In my mind 'options' are optional. Since
      # both host and port are required for this to work I like the idea of making
      # them individual parameters rather than values in an options hash. To me
      # it makes the method more explicit. But I also admit I still retain a few
      # habits from many years programming in compiled languages like C++ and Java.
      # -Jerry
      #@host = opts[:host] || DEFAULT_HOST
      #@port = opts[:port] || DEFAULT_PORT
      @host = host
      @port = port

      @dispatcher = ActorMethodDispatcher.new
    end

    def running?
      super && @drb_server.alive?
    end

    def add(id, mailbox)
    end

    protected

    def on_run
      start_drb_server unless running?
    end

    def after_run
    end

    def on_task
    end

    def on_stop
      @drb_server.stop_service if running?
    end

    private

    def server_uri
      @server_uri ||= "druby://#{@host}:#{@port}"
    end

    def start_drb_server
      @drb_server = DRb.start_service(server_uri, @dispatcher)
    end
  end
end
