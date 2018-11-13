#!/usr/bin/env ruby
# frozen_string_literal: true

require "nokogiri"
require "open-uri"
require "json"
require "google-search"
require "uri"

# The main XKCD driver
class XKCD
  # Get img/comic URL from xkcd
  #
  # Example:
  #   >> XKCD.img
  #   => "https://imgs.xkcd.com/comics/hell.png"
  #
  #   >> XKCD.comic
  #   => "https://xkcd.com/891/"

  def self.comic
    open("https://dynamic.xkcd.com/random/comic/").base_uri.to_s
  end

  def self.search(query)
    comic_id = 149 # Default to make me a sandwich if nothing can be found
    Google::Search::Web.new(query: "xkcd " + query).each do |result|
      current_url = URI(result.uri) # Parse the search result URL
      next unless current_url.hostname == "xkcd.com" # Ignore all of URLs which are not from XKCD.com

      id = current_url.path.gsub(/\//, "").to_i # Checking to make sure that only a URL with a comic strip ID is taken
      if id != 0
        comic_id = id
        break
      end
    end

    get_comic(comic_id)
  end

  class << XKCD
      alias get comic
  end

  #     def self.img
  #         img = Nokogiri::HTML(open('https://dynamic.xkcd.com/random/comic/')).css('#comic img')[0]
  #         img_url = img.attributes["src"].value
  #         img_title = img.attributes["title"].value
  #         "#{img_title} : #{img_url}"
  #     end
  def self.img
    max = JSON.parse(open("https://xkcd.com/info.0.json").read)["num"]
    comic_num = 1 + rand(max - 1)
    comic_num = 1 if comic_num == 404 # Avoid 404th comic ;)
    get_comic(comic_num)
  end

  def self.get_comic(id)
    comic = JSON.parse(open("https://xkcd.com/#{id}/info.0.json").read)
    "#{comic["alt"]} : #{comic["img"]}"
  end
end
