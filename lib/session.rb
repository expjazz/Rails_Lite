# frozen_string_literal: true

require 'json'

class Session
  attr_accessor :cookie, :cookie_val
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    @cookie = req.cookies['_rails_lite_app']
    @cookie_val = if @cookie
                    JSON.parse(@cookie)
                  else
                    {}
                  end
  end

  def [](key)
    @cookie_val[key]
  end

  def []=(key, val)
    @cookie_val[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    res.set_cookie('_rails_lite_app', { path: '/', value: @cookie_val.to_json })
  end
end
