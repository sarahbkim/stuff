# Sets:
# order is not enforced -- need to set key as insertion order, value as items? hashtable auto-orders... 
# unique elements only
# supports the following operations: 
#  - add: S1.add(1,2,4) => { 1, 2, 4}
#  - remove: S1.remove(4) => { 1, 2}
#  - exists?: S1.exists?(1) => true
#  - empty?: S1.empty? => false
#  - size: S1.size => 2
#  - print / enumerate: S1.print() => {1, 2}
#
#  - flatten: S2.flatten() => {1, 2, 3, 4}
#  - equal: S1.equal?(S2) => false
#  - sum: S1.sum() => 3
#  - union: S1.union(S2) => {1, 2, 3, 4}
#  - intersection: S1.intersect(S2) => {1, 2}
#  - difference: S1.diff(S2) => {3, 4}
#  - subset: S1.subset(S2) => true 
require 'forwardable'
require_relative '../hashtable/hashtable'

class Set

  def initialize(args=[])
    @size = 0
    @s = HashTable.new()
    args.each{|a| self.add(a)} 
  end

  def add(item)
    unless self.exists(item)
      @s.insert(item, true)
      @size+= 1
    end
  end

  def remove(item)
    # hashtable returns 'nil' if not found
    if @s.delete(item)
      @size-=1
    end
  end

  def exists(item)
    @s.find(item) ? true : false
  end

  def is_empty?
    return @size == 0
  end
  
  def size
    return @size
  end

  def print
    keys = @s.keys.join(', ')
    return "{#{keys}}"
  end

  def each
    @s.each do |item|
      if item
        yield item
      end
    end
  end

  def union(set)
    set.each do |item|
      val = item.keys.first
      self.add(val)
    end
  end

  def clear
    @size = 0
    @s = HashTable.new()
  end

  def intersect(set)
    intersected = []
    set.each do |item|
      val = item.keys.first
      intersected << val if self.exists(val)
    end

    self.clear
    intersected.each do |item|
      self.add(item)
    end
  end

end
