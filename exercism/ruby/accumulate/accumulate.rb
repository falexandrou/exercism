module BookKeeping
  VERSION = 2
end

module Enumerable
  def accumulate &block
    return to_enum(__method__) unless block_given?
    each_with_object([]) { |val, output| output << yield(val) }
  end
end
