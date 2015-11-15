require_relative 'hashpair'
require_relative 'hashpairlist'

require 'test/unit'

class TestHashPairList < Test::Unit::TestCase
  def setup
    @l = HashPairList.new
    @h0 = ["key0", 0]
    @h1 = ["key1", 1]
    @h3 = ["key2", 2]
  end

  def test_initialize
    assert_equal(0, @l.size())
  end

  def test_insert
    @l.insert("key", 1)
    assert_equal(1, @l.size())

    # should override same key and not increase the size
    @l.insert("key", 3)
    assert_equal(1, @l.size())

    @l.insert("key2", 2)
    assert_equal(2, @l.size())

    @l.insert("key", 3)
    assert_equal(2, @l.size())
  end

  def test_get_keys
    @l.insert(@h0[0], @h0[1])
    @l.insert(@h1[0], @h1[1])
    keys = @l.keys
    assert_equal(["key0", "key1"], keys)
    @l.insert(@h3[0], @h3[1])
    keys2 = @l.keys
    assert_equal(["key0", "key1", "key2"], keys2)
  end

  def test_delete
    @l.insert(@h0[0], @h0[1])
    @l.insert(@h1[0], @h1[1])
    @l.insert(@h3[0], @h3[1])
    assert_equal(3, @l.size)
    @l.delete("key0")
    assert_equal(2, @l.size)
    @l.delete("key1")
    assert_equal(1, @l.size)
  end

  def test_find
    @l.insert(@h0[0], @h0[1])
    @l.insert(@h1[0], @h1[1])
    @l.insert(@h3[0], @h3[1])
    item = @l.find("key0")
    assert_equal(@h0[1], item)
    item2 = @l.find("key1")
    assert_equal(@h1[1], item2)
    assert_equal(3, @l.size)
  end

  def test_to_string
    @l.insert(@h0[0], @h0[1])    
    @l.insert(@h1[0], @h1[1])
    str = @l.to_string
    assert_equal("key0: 0, key1: 1", str)
    @l.insert(@h0[0], @h0[1])    
    assert_equal("key0: 0, key1: 1", str)
  end

end


