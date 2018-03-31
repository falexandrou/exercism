module BookKeeping
  VERSION = 1
end

class SumOfMultiples
  def initialize *nums
    @nums = nums
  end

  def to max
    0.upto(max-1).select { |n| @nums.any? { |i| n % i == 0 } }.sum
  end
end
