#!/usr/bin/evn ruby
require 'net/http'
require 'open-uri'
# The main XKCD driver
class XKCD
    # Get img/comic URL from xkcd
    #
    # Example:
    #   >> XKCD.img
    #   => "http://imgs.xkcd.com/comics/hell.png" 
    #
    #   >> XKCD.comic
    #   => "http://xkcd.com/891/"

    def self.comic()
       open('http://dynamic.xkcd.com/random/comic/').base_uri.to_s
    end
    
    def self.img
        url = 'http://dynamic.xkcd.com/random/comic/'
        html = open(url).read()
        imgs = URI.extract(html).select{ |l| l[/comics\//]}
        imgs.first
    end
end
