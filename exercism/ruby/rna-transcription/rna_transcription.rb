module BookKeeping
  VERSION = 1
end

class Complement
  MAPPING = {
    "G" => "C",
    "C" => "G",
    "T" => "A",
    "A" => "U",
  }

  class << self
    def of_dna dna
      seq = dna.chars

      return "" if (seq.uniq - MAPPING.keys).length > 0

      seq.map {|c| MAPPING[c] }.join("")
    end
  end
end
