require 'drb/drb'

module Concurrent
  module Actor
    class DrbAdapter

      def initialize(opts = {})
        @server_uri   = opts[:server_uri]
        @front_object = Concurrent::AtomicReference.new(opts[:object])
      end

      def set(front_object)
        @front_object.set(front_object)
      end

      def start
        DRb.start_service(@server_uri, @front_object.get)
      end
    end
  end
end
