class HashPair
  
  def initialize(key=nil, value=nil)
    @key = key
    @value = value
    @next = nil
  end

  def get_key
    return @key
  end

  def get_value
    return @value
  end

  def next=(hashpair)
    @next = hashpair
  end

  def next
    @next
  end

end

class Sentry
  def initialize
    @next = nil
  end

  def next=(item)
    @next = item
  end

  def next
    @next
  end
end

class HashPairList
  def initialize
    @head = Sentry.new
    @size = 0
  end

  def size
    return @size
  end

  def insert(hashpair)
    @size += 1
    if @head.next
      curr_node = @head.next
      while curr_node.next != nil
        curr_node = curr_node.next
      end
      curr_node.next = hashpair
    else
      @head.next = hashpair
    end
    return hashpair
  end

  def delete(key)
    unless @head
      return nil #TODO: or return an exception?
    end
    
    start = @head

    while start.next != nil
      if start.next.get_key == key
        start.next = if start.next.next then start.next.next else nil end
        @size -= 1
        return key 
      end
      start = start.next
    end

  end

  def find(key)
    unless @head
      return nil
    end

    curr_node = @head.next
    while curr_node != nil
      if curr_node.key == key
        return curr_node
      else
        curr_node = curr_node.next
      end
    end
    return nil
  end

end

class HashTable

  def initialize
    @table = []
  end
  
  def insert(key, value)
    i = parse_key(key)
    item = HashPair.new(key, value)

    @table[i] = if @table[i] then @table[i] else HashPairList.new() end
    @table[i].add(item)

    return item
  end
  
  def find(key)
    i = parse_key(key)
    if @table[i] 
      return @table[i].find(key)
    else
      return nil
    end
  end

  def remove(key)
   i = parse_key(key)
   if @table[i]
     return @table[i].delete(key)
   else
     return nil
   end

  end


  private

  def parse_key(key)
    hash_code = create_hashcode(key)
    return compress_code(hash_code)
  end

  #TODO: implement!
  def compress_code(hashcode)
    return hashcode
  end

  #TODO: implement!
  def create_hashcode(key)
    return key
  end

end
