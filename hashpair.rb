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

  def to_string
    "#{@key}: #{@value}"
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
