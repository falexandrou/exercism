module BookKeeping
  VERSION = 2
end

class Gigasecond
  class << self
    def from ts
      Time.at(ts.to_i + 10**9).utc
    end
  end
end
