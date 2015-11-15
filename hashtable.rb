require_relative 'hashpairlist'

class HashTable

  def initialize
    @table = []
    @size = 0
  end
  
  def to_string
    hlists = []
    @table.each do |hlist|
      if hlist
        hlists << hlist.to_string
      end
    end
    return "{" + hlists.join(', ') + "}"
  end

  def keys
    keys = []
    @table.each do |t|
      if t
        keys << t.keys
      end
    end
    keys.flatten
  end

  def insert(key, value)
    i = parse_key(key)
    @table[i] = @table[i] ? @table[i] : HashPairList.new()
    prevSize = @table[i].size
    (@table[i]).insert(key, value)
    @size += @table[i].size - prevSize
  end
  
  def find(key)
    i = parse_key(key)
    if @table[i] 
      pair = @table[i].find(key)
      if pair
        return pair
      end
    else
      return nil
    end
  end

  def delete(key)
   i = parse_key(key)
   if @table[i]
     prevSize = @table[i].size
     @table[i].delete(key)
     @size -= 1
   else
     return nil
   end
  end

  def size
    @size
  end

  private

  def parse_key(key)
    hash_code = create_hashcode(key)
    compress_code(hash_code)
  end

  def compress_code(hashcode)
    ((7 * hashcode + 5) % 127 ) % 10000
  end

  def create_hashcode(key)
    hashVal = 0
    if key.is_a? Numeric
      hashVal = key
    end

    if key.is_a? String or key.is_a? Symbol
      key = if key.is_a? Symbol then ":" + key.to_s else key end
      key.each_byte do |k|
        hashVal = (127 * (hashVal + k)) % 16908799
      end
    end
    hashVal
  end

end
