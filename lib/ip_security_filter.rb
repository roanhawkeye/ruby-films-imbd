class IpSecurityFilter
  def initialize(app)
    @app = app
  end

  def call(env)
    req = Rack::Request.new(env)

    allowed_ips = ["127.0.0.1", "::1" ] 
    
    if allowed_ips.include? req.ip
      @app.call(env)
    else
      [403, {}, ""]
    end
  end
end
