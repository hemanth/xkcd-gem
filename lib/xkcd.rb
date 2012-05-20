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
       # This method gets random comic links from xkcd, the uri is the redirected location found in the resp headers
       uri = URI.parse 'http://dynamic.xkcd.com/random/comic/'
       req = Net::HTTP::Get.new(uri.request_uri)
       http = Net::HTTP.new(uri.host)
       res = http.start { |server|
       server.request(req)
       }
       res["location"]
    end
    
    def self.img
        url = 'http://dynamic.xkcd.com/random/comic/'
        html = open(url).read()
        imgs = URI.extract(html).select{ |l| l[/comics\//]} 
        imgs.first       
    end
end
