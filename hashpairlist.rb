require_relative 'hashpair'

class HashPairList
  def initialize
    @head = Sentry.new
    @size = 0
  end

  def to_string
    nodes = []
    if @head.next
      curr = @head.next
      until curr == nil
        nodes << curr.to_string
        curr = curr.next
      end
    end
    return nodes.join(', ')
  end

  def keys
    keys = []
    if @head.next
      curr = @head.next
      while curr
        keys << curr.key
        curr = curr.next
      end
    end
    keys
  end

  def size
    return @size
  end

  def insert(key, value)
    curr = @head
    until curr.next == nil
      curr = curr.next
      if curr.key == key
        curr.value = value
        return
      end
    end
    curr.next = HashPair.new(key, value)
    @size += 1
  end

  def delete(key)
    prev = @head

    while prev.next
      curr = prev.next
      if curr.key == key
        prev.next = curr.next
        @size -= 1
        return
      end
      prev = curr 
    end

  end

  def find(key)
    unless @head
      return nil
    end

    curr = @head.next
    while curr
      if curr.key == key
        return curr.value
      else
        curr = curr.next
      end
    end
    return nil
  end

end
