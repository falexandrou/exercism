module BookKeeping
  VERSION = 4
end

class Squares
  def initialize(num)
    @range = 1.upto(num)
  end

  def difference
    square_of_sum - sum_of_squares
  end

  def square_of_sum
    @range.sum ** 2
  end

  def sum_of_squares
    @range.sum { |n| n ** 2 }
  end
end
