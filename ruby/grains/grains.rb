module BookKeeping
  VERSION = 1
end

class Grains
  class << self
    def square n
      raise ArgumentError.new if n < 1 || n > 64

      2.upto(n).reduce(1) { |cur| cur *= 2 }
    end

    def total
      1.upto(64).map { |i| square(i) }.sum
    end
  end
end
