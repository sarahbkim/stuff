class HashPair
  
  def initialize(key=nil, value=nil)
    @key = key
    @value = value
    @next = nil
  end

  def key=(key)
    @key = key
  end

  def key
    @key
  end

  def value=(value) 
    @value = value
  end

  def value
    @value
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

class Sentry < HashPair
  def initialize
    @next = nil
    @key = nil
    @value = nil
  end
end
