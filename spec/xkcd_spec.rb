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
  
  # The get_comic method
  #
  describe "get_comic" do
    it "should return the ALT text and URI of the image for a specific comic" do
      comic = XKCD.get_comic(403)
      comic.must_match /^.+ : http:\/\/imgs\.xkcd\.com\/comics\/.+\.(png|jpg)$/
      assert(comic.include?("http://imgs.xkcd.com/comics/convincing_pickup_line.png"))
    end
  end
  
  describe "search" do
     it "should be able to find a desired comic" do
       expected = "Okay, Lance.  For entry into the college bowl, spell 'Throbbing' : http://imgs.xkcd.com/comics/rule_34.png"
       actual = XKCD.search("rule 34")
       assert_equal(expected, actual)
     end
     
     it "should default to make me a sandwich on a bad search" do
       expected = "Proper User Policy apparently means Simon Says. : http://imgs.xkcd.com/comics/sandwich.png"
       actual = XKCD.search("asldkfjaslkdjflaksjfdlwjkef")   
       assert_equal(expected, actual)
     end  
  end
end
