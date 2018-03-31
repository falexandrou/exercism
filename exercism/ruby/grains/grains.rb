module BookKeeping
  VERSION = 2
end

class Grains
  class << self
    def square n
      raise ArgumentError.new if n < 1 || n > 64
      2 ** (n-1)
    end

    def total
      1.upto(64).sum { |i| square(i) }
    end
  end
end
