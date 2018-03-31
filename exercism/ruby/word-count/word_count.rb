module BookKeeping
  VERSION = 1
end

class Phrase
  def initialize phrase
    @phrase = phrase
  end

  def word_count
    wc = {}

    words.each do |w|
      wc[w] ||= 0
      wc[w] += 1
    end

    wc
  end

  private
  def words
    @phrase.downcase.scan(/\w+(?:'\w+)*/)
  end
end
