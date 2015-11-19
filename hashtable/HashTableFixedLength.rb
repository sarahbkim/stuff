require 'hashtable'

class HashTableFixedLength < HashTable
  MIN_ENTRIES = 6

  def initialize
    @entries = 0
    @buckets = 1 
    @table = Array.new(@buckets) #create fixed-sized array
  end

  def insert(key, value)
    if @entries <= MIN_ENTRIES 
      # just use one bucket
    else
      # check load_factor
      # increase bucket size
      # need to rewrite compression fn
      super.insert(key, value)
    end
  end

  private

  #TODO: add tests for this!
  def compress_code(hashcode)
    (( 7 * hashcode + 5) % 127 ) % @buckets
  end

  def increase_buckets
    @buckets = @buckets * 2
  end

  def load_factor
    return @entries / @buckets
  end

end

