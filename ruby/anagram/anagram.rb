module BookKeeping
  VERSION = 1
end

class Anagram
  def initialize(word)
    @word   = word.downcase
    @sorted = self.class.sorted_chars(@word)
  end

  def match words
    words.select do |word|
      !equal?(word) && self.class.sorted_chars(word.downcase) == @sorted
    end
  end

  private

  def equal? w
    w.downcase == @word
  end

  def self.sorted_chars(word)
    word.chars.sort
  end
end
