class BinarySearch
  attr_reader :list

  def initialize list
    @list = list
  end

  def search_for x
    low = 0
    high = @list.length - 1

    while low <= high
      middle = (low + high) / 2

      if x > @list[middle]
        low = middle + 1
      elsif x < @list[middle]
        high = middle - 1
      else
        return middle
      end
    end

    -1
  end
end
