require 'sinatra'
require 'redis'

module Sinatra
  class Base
    set :server, %w[thin mongrel webrick]
    set :bind, '0.0.0.0'
    set :port, 8080
  end
end

redis = Redis.new(:host => ENV['REDIS_PORT_6379_TCP_ADDR'],
                  :port => ENV['REDIS_PORT_6379_TCP_PORT'],
                  :password => ENV['REDIS_PASSWORD'])

get '/' do
  host=ENV['REDIS_PORT_6379_TCP_ADDR']
  port=ENV['REDIS_PORT_6379_TCP_PORT']
  password=ENV['REDIS_PASSWORD']
  "Redis_info:\nhost is#{host}\nport is:#{port}\npassword is:#{password}"
end

get '/set/*/*' do
  redis.set(params['splat'][0],params['splat'][1])
end

get '/get/:name' do
  redis.get(params['name'])
end
