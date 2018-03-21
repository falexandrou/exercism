module BookKeeping
  VERSION = 4
end

class Prime
  class << self
    def nth(num)
      raise ArgumentError.new if num <= 0

      found_primes = 1
      current_prime = 2
      n = 2

      while found_primes <= num
        if prime?(n)
          current_prime = n
          found_primes += 1
        end

        n += (n == 2 ? 1 : 2)
      end

      current_prime
    end

    private

    def prime?(num)
      return false if (num.even? && num > 2) || num < 2

      (2..Math.sqrt(num).floor).none? { |k| num % k == 0 }
    end
  end
end
