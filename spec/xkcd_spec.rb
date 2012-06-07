# encoding: utf-8

require_relative 'spec_helper.rb'

# Specs for the XKCD class
#
describe XKCD do

  # The comic class method
  #
  describe "comic" do
    it "should return the URI for a random comic" do
      XKCD.comic.must_match /^http:\/\/xkcd\.com\/\d{1,4}\/$/
    end
  end

  # The get alias method
  #
  describe "get" do
    it "should return the URI for a random comic" do
      XKCD.get.must_match /^http:\/\/xkcd\.com\/\d{1,4}\/$/
    end
  end

  # The img class method
  #
  describe "img" do
    it "should return the ALT text and URI of the image for a random comic" do
      XKCD.img.must_match /^.+ : http:\/\/imgs\.xkcd\.com\/comics\/.+\.(png|jpg)$/
    end
  end
end
