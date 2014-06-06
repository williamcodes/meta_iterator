class MetaIterator
  def initialize(it_arr)
    @it_arr = it_arr
    @index = 0
    @counter = 0
    @size = it_arr.count
  end

  def next
    if self.has_next?
      output = @it_arr[@index].next
      @index = (@index + 1) % @size
      return output
    end
  end

  def has_next?
    if @it_arr[@index].has_next?
      @counter = 0
      return true
    else
      return false if @counter == @size
      @counter += 1
      @index = (@index + 1) % @size
      self.has_next?
    end    
  end  
end