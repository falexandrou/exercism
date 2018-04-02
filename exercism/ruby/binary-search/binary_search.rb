class BinarySearch
  attr_reader :list

  def initialize list
    raise ArgumentError.new if list != list.sort

    @list = list
    reset_pointers
  end

  def middle
    (@low + @high) / 2
  end

  def search_for x
    reset_pointers

    while @low <= @high do
      mid = middle

      if x < @list[mid]
        @high = mid - 1
      elsif x > @list[mid]
        @low = mid + 1
      else
        return mid
      end
    end

    raise RuntimeError.new "404 Not Found"
  end

  def search_for_recursive x, low=nil, high=nil
    @low = low unless low.nil?
    @high = high unless high.nil?

    mid = middle

    if x < @list[mid]
      return search_for_recursive(x, low, mid -1)
    elsif x > @list[mid]
      return search_for_recursive(x, mid+1, high)
    else
      return mid
    end

    raise RuntimeError.new "404 Not Found"
  end

  private

  def reset_pointers
    @low  = 0
    @high = list.length - 1
  end
end
