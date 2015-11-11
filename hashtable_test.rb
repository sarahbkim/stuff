require_relative 'hashtable'
require 'test/unit'

class TestHashPair < Test::Unit::TestCase
  def test_initialize
    assert_equal(nil, HashPair.new("key0", 0).next())
    assert_equal(nil, HashPair.new().next())
    assert_equal(0, HashPair.new("key0", 0).get_value())
    assert_equal("key0", HashPair.new("key0", 0).get_key())
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

class TestHashPairList < Test::Unit::TestCase
  def setup
    @l = HashPairList.new
    @h0 = HashPair.new("key0", 0)
    @h1 = HashPair.new("key1", 1)
    @h3 = HashPair.new("key2", 2)
  end
  def test_initialize
    assert_equal(0, @l.size())
  end

  def test_insert
    @l.insert(@h0)    
    assert_equal(1, @l.size())
    assert_equal(@h0, @l.find("key0"))
    @l.insert(@h1)
    assert_equal(2, @l.size())
  end

  def test_delete
  end

  def test_find
  end
end


