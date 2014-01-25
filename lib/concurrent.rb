require 'concurrent/version'

require 'concurrent/actor'
require 'concurrent/actor_method_dispatcher'
require 'concurrent/actor_server'
require 'concurrent/agent'
require 'concurrent/contract'
require 'concurrent/channel'
require 'concurrent/dereferenceable'
require 'concurrent/event'
require 'concurrent/future'
require 'concurrent/obligation'
require 'concurrent/postable'
require 'concurrent/promise'
require 'concurrent/remote_actor'
require 'concurrent/runnable'
require 'concurrent/scheduled_task'
require 'concurrent/stoppable'
require 'concurrent/supervisor'
require 'concurrent/timer_task'
require 'concurrent/utilities'

require 'concurrent/global_thread_pool'

require 'concurrent/cached_thread_pool'
require 'concurrent/fixed_thread_pool'
require 'concurrent/immediate_executor'

require 'concurrent/event_machine_defer_proxy' if defined?(EventMachine)

# Modern concurrency tools for Ruby. Inspired by Erlang, Clojure, Scala, Haskell,
# F#, C#, Java, and classic concurrency patterns.
#
# The design goals of this gem are:
#
# * Stay true to the spirit of the languages providing inspiration
# * But implement in a way that makes sense for Ruby
# * Keep the semantics as idiomatic Ruby as possible
# * Support features that make sense in Ruby
# * Exclude features that don't make sense in Ruby
# * Be small, lean, and loosely coupled
module Concurrent

end
