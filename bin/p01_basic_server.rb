# frozen_string_literal: true

require 'pry'
require 'rack'
app = proc do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  test = req.url
  res['Content-Type'] = 'text/html'
  res.write(test)
  res.finish
end

Rack::Server.start(
  app: app,
  Port: 3000
)
