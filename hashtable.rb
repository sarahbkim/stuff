require_relative 'hashpair'
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

  def insert(key, value)
    # see if key already exists
    unless self.find(key)
      i = parse_key(key)
      item = HashPair.new(key, value)
      @table[i] = @table[i] ? @table[i] : HashPairList.new()
      (@table[i]).insert(item)
      @size += 1
    end
  end
  
  def find(key)
    i = parse_key(key)
    if @table[i] 
      pair = @table[i].find(key)
      if pair
        return pair.get_value
      end
    else
      return nil
    end
  end

  def remove(key)
   i = parse_key(key)
   if @table[i]
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
      key = if key.is_a? Symbol then key.to_s + "symbol" else key end
      key.each_byte do |k|
        hashVal = (127 * (hashVal + k)) % 16908799
      end
      puts key, hashVal
    end
    hashVal
  end

end
