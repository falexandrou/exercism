module BookKeeping
  VERSION = 1
end

class Binary
  class << self
    def to_decimal str
      raise ArgumentError.new if str.match /[^0-1]/

      str.reverse.each_char.with_index.sum do |(num, idx)|
        num.to_i * (2 ** idx)
      end
    end
  end
end
