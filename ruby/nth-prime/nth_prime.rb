module BookKeeping
  VERSION = 5
end

class Prime
  class << self
    def nth(num)
      raise ArgumentError.new if num <= 0
      return 2 if num == 1

      found_primes = 1
      current_prime = 2
      n = 3

      while found_primes < num
        if prime?(n)
          current_prime = n
          found_primes += 1
        end

        n += 2
      end

      current_prime
    end

    private

    def prime?(num)
      return false if num < 2

      (2..Math.sqrt(num).floor).none? { |k| num % k == 0 }
    end
  end
end
