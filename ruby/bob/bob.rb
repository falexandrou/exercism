module BookKeeping
  VERSION = 1
end

class Bob
  class << self
    def hey remark
      remark = remark.strip

      return "Fine. Be that way!" if silence?(remark)
      return 'Whoa, chill out!' if screaming?(remark)
      return "Sure." if asking?(remark)

      "Whatever."
    end

    private

    def screaming? remark
      !remark.match(/[a-z]+/) && remark.match(/[A-Z]+/)
    end

    def asking? remark
      remark.end_with? '?'
    end

    def silence? remark
      remark.empty?
    end
  end
end
