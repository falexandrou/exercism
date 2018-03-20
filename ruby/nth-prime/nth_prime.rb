module BookKeeping
  VERSION = 1
end

class Prime
  class << self
    def nth(num)
      raise ArgumentError.new if num == 0

      found_primes = 1
      current_prime = 2
      n = 2

      while found_primes <= num
        is_prime = 2.upto(n-1).any? { |k| n % k == 0 } == false

        if is_prime
          current_prime = n
          found_primes += 1
        end

        n += (n == 2 ? 1 : 2)
      end

      current_prime
    end
  end
end
