# encoding: utf-8

require 'minitest/autorun'
require 'minitest/spec'

begin
  require 'minitest/pride'
rescue LoadError
  # Continue, but without colors
end

# Note that relative requirements
# are only available in Ruby 1.9
#
require_relative '../lib/xkcd.rb'
