class MetaIterator
  def initialize(it_arr)
    @it_arr = it_arr
    @exhausted = []
    @index = 0
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
    return false if @it_arr.count == 0
    return true if @it_arr[@index].has_next?
      
    @exhausted << @it_arr.delete_at(@index)
    @size -= 1
    @index = @index % @size unless @size == 0
    self.has_next?
  end  
end