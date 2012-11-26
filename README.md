# Rack::ChromeFrame

A Rack middleware for inserting a Chrome Frame install prompt for requests made
by Internet Explorer.

This project is a modification of the original, unmaintained [rack-chromeframe](https://github.com/sunlightlabs/rack-chromeframe).

## Installation

Add this line to your application's Gemfile:

    gem 'rack-chrome_frame', :require => 'rack/chrome_frame'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-chrome_frame

## Usage

Just install and go.

## TODO

* IE version configuration - only display the prompt if IE version matches the config.
* Less obtrusive configuration - do not completely disable the site, make less obtrusive
* Tests

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
