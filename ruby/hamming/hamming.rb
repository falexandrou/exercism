module BookKeeping
  VERSION = 1
end

class Hamming
  class << self
    def compute a, b
      raise ArgumentError.new if !a || !b || a.length != b.length

      a.chars.zip(b.chars).count {|c1, c2| c1 != c2 }
    end
  end
end
