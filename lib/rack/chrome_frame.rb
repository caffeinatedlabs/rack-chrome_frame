module Rack
  class ChromeFrame

    def initialize(app, options={})
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)

      if env['HTTP_USER_AGENT'] =~ /MSIE/ && headers['Content-Type'] =~ /text\/html/ 
        response.body = body_with_chrome_frame(response) 
        headers.merge("Content-Length" => response.body.length.to_s)
      end
      
      [status, headers, response]
    end

    def body_with_chrome_frame(response)
      body_to_string = response.body.to_s
      head = <<-HEAD
      <meta http-equiv="X-UA-Compatible" content="chrome=1">
      HEAD
      
      bod = <<-BOD
      <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/chrome-frame/1/CFInstall.min.js"></script>
      <div id="cf-placeholder"></div>
      <script>CFInstall.check({node: "cf-placeholder"});</script>
      BOD

      body_to_string.gsub!(/<\/head>/, head + "\n</head>")
      body_to_string.gsub!(/<\/body>/, bod  + "\n</body>")
      [body_to_string]
    end

  end
end