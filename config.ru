require 'rack'
require 'rack/static'
use Rack::Static, root: "public",
                  urls: %w[
                    /flash
                    /images
                    /javascripts
                    /stylesheets
                  ]

require './site'
run Sinatra::Application

