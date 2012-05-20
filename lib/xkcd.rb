#!/usr/bin/env ruby
require 'hpricot'
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

    def self.comic
        open('http://dynamic.xkcd.com/random/comic/').base_uri.to_s
    end
    
    class << XKCD
        alias_method :get, :comic
    end
      
    def self.img
        Hpricot(open('http://dynamic.xkcd.com/random/comic/')).search("#comic img").first.raw_attributes["src"]
    end
end
