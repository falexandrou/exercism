module BookKeeping
  VERSION = 1
end


class Raindrops
  SOUNDS = {
    3 => "Pling",
    5 => "Plang",
    7 => "Plong",
  }

  class << self
    def convert num
      snd = SOUNDS.keys.map { |s| num % s == 0 ? SOUNDS[s] : nil }.compact
      snd = [num] if snd.length == 0
      snd.join("")
    end
  end
end
