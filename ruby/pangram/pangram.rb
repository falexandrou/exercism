module BookKeeping
  VERSION = 1
end

class Pangram
  class << self
    def pangram? phrase
      chars = phrase.chars.map(&:downcase).uniq
      "a".upto("z").all? {|letter| chars.include? letter}
    end
  end
end
