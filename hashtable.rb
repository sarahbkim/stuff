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
        hlists << hlist.to_string #TODO: why is nil added at the start? 
      end
    end
    return "{" + hlists.join(', ') + "}"
  end

  def insert(key, value)
    i = parse_key(key)
    item = HashPair.new(key, value)
    @table[i] = @table[i] ? @table[i] : HashPairList.new()
    (@table[i]).insert(item)
    @size += 1
  end
  
  def find(key)
    i = parse_key(key)
    if @table[i] 
      pair = @table[i].find(key)
      return pair.get_value
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
    return compress_code(hash_code)
  end

  #TODO: implement!
  def compress_code(hashcode)
    hashcode
  end

  #TODO: implement!
  def create_hashcode(key)
    key
  end

end
