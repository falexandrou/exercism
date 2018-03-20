module BookKeeping
  VERSION = 1
end

class Roman
  @num = 0

  MAPPING = {
    1 => "I",
    4 => "IV",
    5 => "V",
    9 => "IX",
    10 => "X",
    40 => "XL",
    50 => "L",
    90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
    1_000 => "M",
  }

  def initialize num
    @num = num
  end

  def convert
    return "" if @num == 0
    str = ""

    brackets = MAPPING.keys.reverse.reject { |n| @num / n == 0 }

    remainder = @num

    brackets.each do |cur|
      mul = remainder / cur
      mul.times { str += MAPPING[cur] }
      remainder = remainder % cur
    end

    str
  end
end


class Fixnum
  def to_roman
    Roman.new(self).convert
  end
end
