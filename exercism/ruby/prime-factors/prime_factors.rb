require "prime"

class PrimeFactors
  class << self
    def for num
      return [] if num <= 1

      remainder = num
      divisors = []
      divisor = 2

      while remainder > 1
        if remainder % divisor == 0
          remainder = remainder / divisor
          divisors.push(divisor)
        else
          divisor += 1
        end
      end

      divisors
    end
  end
end
