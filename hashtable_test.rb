require_relative 'hashpair'
require_relative 'hashpairlist'
require_relative 'hashtable'

require 'test/unit'

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
#    @h.insert(:mouse, "they are just normal")
#    assert_equal(3, @h.size)
#
#    @h.insert("cat", "they are like gone girl")
#    @h.insert("cat", "they are like gone girl")
#    @h.insert("cat", "they are like gone girl")
#    @h.insert("dog", "they are like drunk fun friends")
#    @h.insert("mouse", "they are just normal")
#    puts @h.to_string
#    assert_equal(6, @h.size)
  end

  def test_replace_val
    @h.insert("cat", "they are like gone girl")
    v0 = @h.find("cat")
    assert_equal("they are like gone girl",v0) 
    @h.insert("cat", "they are not like gone girl")
    v = @h.find("cat")
    assert_equal("they are not like gone girl",v)

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
    assert_equal("{1: dog, 2: mouse, 3: cat}", @h.to_string)
  end

  def test_keys
    @h.insert(3, "cat")
    @h.insert(1, "dog")
    @h.insert(2, "mouse")
    assert_equal([1, 2, 3], @h.keys)
    @h.insert(:cat, "they are like gone girl")
    @h.insert("cat", "they are like gone girl string")
    @h.insert("dog", "they are like drunk fun friends")
    @h.insert("mouse", "they are just normal")
    assert_equal([1, 2, 3, :cat, "cat", "dog", "mouse"], @h.keys)
  end

end


