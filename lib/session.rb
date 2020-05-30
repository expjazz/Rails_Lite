# frozen_string_literal: true

require 'json'

class Session
  attr_accessor :cookie, :cookie_val
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    @cookie = req.cookies['_rails_lite_app']
    if @cookie
      @cookie_val = JSON.parse(@cookie)
    else
      res.set_cookie(_rails_lite_app, path: '/', value: {}.to_json)
    end
  end

  def [](key); end

  def []=(key, val); end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res); end
end
