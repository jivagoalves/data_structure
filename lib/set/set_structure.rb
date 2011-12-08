class SetStructure
  def initialize
    @length = 0
    @elements = []
  end

  def empty?
    @length == 0
  end
  
  def add(element)
    @elements[@length] = element
    @length += 1
  end

  def contains?(element)
    0.upto (@length - 1) do |i|
      return true if @elements[i] == element
    end
    false
  end
end
