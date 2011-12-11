module DataStructure
  class SetStructure
    attr_reader :size

    def initialize(*elements)
      @size = elements.size || 0
      @elements = elements || []
    end

    def empty?
      @size == 0
    end

    def add(element)
      return if contains?(element)
      @elements[@size] = element
      @size += 1
    end

    def contains?(element)
      0.upto (@size - 1) do |i|
        return true if @elements[i] == element
      end
      false
    end

    def length
      self.size
    end

    def remove(element)
      0.upto (@size - 1) do |i|
        if @elements[i] == element
          @elements[i] = @elements[@size - 1]
          @elements[@size -1] = nil
          @size -= 1
        end
      end
    end
  end
end
