# hello_world.rb
require 'rack'
require 'rack/server'
require './app/hello_world'

class SimpleRackApp
  def self.call(env)
    request = Rack::Request.new(env)
    HelloWorld.new(request.params).response
  end
end
