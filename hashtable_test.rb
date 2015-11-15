require_relative 'hashpair'
require_relative 'hashpairlist'
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

  def test_to_string
    @l.insert(@h0)    
    @l.insert(@h1)
    str = @l.to_string
    assert_equal("key0: 0, key1: 1", str)
    @l.insert(@h0)
    assert_equal("key0: 0, key1: 1", str)
  end

  def test_insert
    @l.insert(@h0)    
    assert_equal(1, @l.size())
    assert_equal(@h0, @l.find("key0"))
    @l.insert(@h1)
    assert_equal(2, @l.size())
  end

  def test_delete
    @l.insert(@h1)
    @l.insert(@h0)
    @l.insert(@h3)
    assert_equal(3, @l.size)
    @l.delete("key0")
    assert_equal(2, @l.size)
    @l.delete("key1")
    assert_equal(1, @l.size)
  end

  def test_find
    @l.insert(@h1)
    @l.insert(@h0)
    @l.insert(@h3)
    item = @l.find("key0")
    assert_equal(@h0, item)
    item2 = @l.find("key1")
    assert_equal(@h1, item2)
    assert_equal(3, @l.size)
  end
end

class TestHashTable < Test::Unit::TestCase
  def setup
    @h = HashTable.new
  end

  def test_initialize
    assert_equal(0, @h.size)
  end

  def test_insert
    @h.insert(:cat, "they are like gone girl")
    @h.insert(:dog, "they are like drunk fun friends")
    @h.insert(:mouse, "they are just normal")
    assert_equal(3, @h.size)
    @h.insert(:mouse, "they are just normal")
    assert_equal(3, @h.size)

    @h.insert("cat", "they are like gone girl")
    @h.insert("cat", "they are like gone girl")
    @h.insert("cat", "they are like gone girl")
    @h.insert("dog", "they are like drunk fun friends")
    @h.insert("mouse", "they are just normal")
    assert_equal(6, @h.size)
  end

  def test_find
    @h.insert(3, "cat")
    @h.insert(1, "dog")
    @h.insert(2, "mouse")
    f = @h.find(2)
    assert_equal("mouse", f)
    f2 = @h.find(3)
    assert_equal("cat", f2)
    f3 = @h.find(1)
    assert_equal("dog", f3)
    assert_equal(3, @h.size)

    @h.insert(:cat, "they are like gone girl")
    @h.insert("cat", "they are like gone girl string")
    f4 = @h.find(:cat)
    assert_equal(f4, "they are like gone girl")
    f5 = @h.find("cat")
    assert_equal(f5, "they are like gone girl string")

    @h.insert("dog", "they are like drunk fun friends")
    @h.insert("mouse", "they are just normal")

  end

  def test_remove
    @h.insert(3, "cat")
    @h.insert(1, "dog")
    @h.insert(2, "mouse")
    assert_equal(3, @h.size)
    @h.remove(2)
    assert_equal(2, @h.size)
  end

  def test_to_string
    @h.insert(3, "cat")
    @h.insert(1, "dog")
    @h.insert(2, "mouse")
    puts @h.to_string
    assert_equal("{1: dog, 2: mouse, 3: cat}", @h.to_string)
  end
end


