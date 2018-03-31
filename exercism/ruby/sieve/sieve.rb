module BookKeeping
  VERSION = 2
end

class Sieve
  def initialize lim
    @range = 2.upto(lim).to_a
  end

  def primes
    @range.each do |r|
      @range.reject! { |n| r != n && n % r == 0 }
    end

    @range
  end
end
