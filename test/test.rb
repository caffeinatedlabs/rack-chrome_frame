require 'test/unit'
require 'rack/test'
require 'rack'
require 'rack/chrome_frame'

class TestApp
  def call(env)
    html = <<-RES
      <html>
        <head>
        </head>
        <body>
        My Sweet Webpage
        </body>
      </html>
    RES
    response = Rack::Response.new
    response["Content-Type"] = "text/html"
    response.write(html)
    response.finish
  end
end

class ChromeFrameTest < Test::Unit::TestCase
  include Rack::Test::Methods

  attr_accessor :app

  def app
    @app ||= Rack::ChromeFrame.new(TestApp.new)
  end

  def test_does_not_insert_chromeframe_without_useragent
    get '/'
    assert last_response.ok?
    refute last_response.body.match('<meta http-equiv="X-UA-Compatible" content="chrome=1">')
  end

  def test_inserts_chromeframe_with_useragent
    get '/', {}, {'HTTP_USER_AGENT' => 'Mozilla/5.0 (compatible; MSIE 6.0; Windows NT 5.1)'}
    assert last_response.body.match('<meta http-equiv="X-UA-Compatible" content="chrome=1">')
  end
end