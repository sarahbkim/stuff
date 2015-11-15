class HashPairList
  def initialize
    @head = Sentry.new
    @size = 0
  end

  def to_string
    nodes = []
    if @head.next
      curr_node = @head.next
      until curr_node == nil
        nodes << curr_node.to_string
        curr_node = curr_node.next
      end
    end
    return nodes.join(', ')
  end

  def keys
    keys = []
    if @head.next
      curr_node = @head.next
      while curr_node
        keys << curr_node.get_key
        curr_node = curr_node.next
      end
    end
    keys
  end

  def size
    return @size
  end

  def insert(hashpair)
    if @head.next
      curr_node = @head.next
      while curr_node.next != nil
        curr_node = curr_node.next
      end
      curr_node.next = hashpair
    else
      @head.next = hashpair
    end
    @size += 1
    return hashpair
  end

  def delete(key)
    unless @head
      return nil
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
      if curr_node.get_key == key
        return curr_node
      else
        curr_node = curr_node.next
      end
    end
    return nil
  end

end
