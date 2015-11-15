require 'test/unit'
require_relative 'hashpair'

class TestHashPair < Test::Unit::TestCase
  def test_initialize
    assert_equal(nil, HashPair.new("key0", 0).next())
    assert_equal(nil, HashPair.new().next())
    assert_equal(0, HashPair.new("key0", 0).value())
    assert_equal("key0", HashPair.new("key0", 0).key())
  end

  def test_next
    pair1 = HashPair.new("key0", 0)
    pair2 = HashPair.new("key1", 1)

    assert_equal(nil, pair1.next())
    assert_equal(nil, pair2.next())
    pair1.next = pair2
    
    assert_equal(pair2, pair1.next())
    assert_equal(nil, pair2.next())
  end

  def test_to_string
    pair1 = HashPair.new("key0", 0)
    str = pair1.to_string
    assert_equal("key0: 0", str)
    pair2 = HashPair.new("key1", 1)
    str2 = pair2.to_string
    assert_equal("key1: 1", str2)
  end
end

class TestSentry < Test::Unit::TestCase
  def test_initialize
    s = Sentry.new
    assert_equal(nil, s.next())
  end

  def test_next
    s = Sentry.new
    h = HashPair.new()
    s.next = h
    assert_equal(h, s.next())
  end
end

