require 'test/unit'

require_relative '../../hashtable/hashtable'
require_relative '../../set/set'

class TestSet < Test::Unit::TestCase
  def setup
    @s = Set.new
    @nums = [10, 3, 1, 3, 2, 1]
    @s1 = Set.new([1, 2, 3])
    @s2 = Set.new([3, 10, 5])
  end

  def test_initialize
    assert_equal(0, @s.size)
    assert_equal('{}', @s.print)
    assert_equal(true, @s.is_empty?)
  end

  def test_initialize_with_args
    assert_equal(3, @s1.size)
    assert_equal(3, @s2.size)
    assert_equal('{1, 2, 3}', @s1.print)
  end

  def test_add
    @s.add(1)
    assert_equal(1, @s.size)
    assert_equal('{1}', @s.print)
  end

  def test_add_multiple
    @nums.each{|num| @s.add(num) }
    assert_equal(4, @s.size)
    assert_equal(false, @s.is_empty?)
    assert_equal('{1, 2, 3, 10}', @s.print)
  end

  def test_existence
    @nums.each{|num| @s.add(num) }
    assert_equal(true, @s.exists(1))
    assert_equal(true, @s.exists(10))
    assert_equal(false, @s.exists(30))
  end

  def test_remove
    @nums.each{|num| @s.add(num) }
    assert_equal(4, @s.size)
    @s.remove(3)
    assert_equal(3, @s.size)
    @s.remove(10)
    assert_equal(2, @s.size)
    assert_equal(false, @s.exists(10))
    assert_equal(false, @s.exists(3))
    assert_equal(true, @s.exists(2))
  end

  def test_union
    @s1.union(@s2)
    assert_equal(5, @s1.size)
    assert_equal(3, @s2.size)
  end 

  def test_union_again
    @s2.union(@s1)
    assert_equal(5, @s2.size)
    assert_equal(3, @s1.size)
  end

  def test_intersect
    @s1.intersect(@s2)
    assert_equal(1, @s1.size)
    assert_equal('{3}', @s1.print)
  end

  def test_intersect_again
    @s2.intersect(@s1)

    assert_equal(1, @s2.size)
    assert_equal('{3}', @s2.print)
  end
end

