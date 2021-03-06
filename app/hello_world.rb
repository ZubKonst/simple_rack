class HelloWorld

  def initialize(params)
    @params = params
  end

  def response
    response = Rack::Response.new
    response.write(body)
    response.status = 200
    sleep_if_required
    response.finish
  end

  private

  def body
    [
      'Hello World',
      "HOST - #{IPSocket.getaddress(Socket.gethostname)}",
      "ProcessID - #{Process.pid}",
      "Sleep time - #{@params['sleep'].to_i}",
      "ENV - #{ENV['RACK_ENV']}",
    ].join("\n")
  end

  def sleep_if_required
    if @params['sleep']
      sleep(@params['sleep'].to_i)
    end
  end
end
