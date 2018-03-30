module BookKeeping
  VERSION = 1
end

class RunLengthEncoding
  class << self
    def encode input
      input.chars.chunk {|c| c}.inject("") do |str, (c, similars)|
        str += (similars.length > 1 ? "#{similars.length}#{c}" : c)
      end
    end

    def decode input
      input.scan(/(\d+)?([^\d])/).inject("") do |str, (cnt, c)|
        str << c * ( cnt ? cnt.to_i : 1)
      end
    end
  end
end
