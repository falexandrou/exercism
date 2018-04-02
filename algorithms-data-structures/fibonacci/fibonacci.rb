class Fibonacci
  def initialize
    @memo = []
  end

  def seq n
    return 0 if n == 0
    return 1 if n <= 2

    if @memo[n].nil?
      @memo[n] = seq(n - 1) + seq(n - 2)
    end

    @memo[n]
  end
end
