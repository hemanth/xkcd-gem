require 'test/unit'
require 'xkcd'

class XKCDTest < Test::Unit::TestCase
  def test_XKCD_get
    assert_not_nil XKCD.get
  end
end
