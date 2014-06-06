class Iterator
  def initialize(arr)
    @arr = arr
    @index = 0
    @size = arr.size
  end

  def next
    @index += 1
    @arr[@index - 1] if @index - 1 < @size
  end

  def has_next?
    @index < @size
  end
end

