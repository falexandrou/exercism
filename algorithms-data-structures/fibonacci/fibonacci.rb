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

  def iterative n
    return 0 if n == 0
    return 1 if n <= 2

    x = 0
    y = 1

    (1..n-1).each do
      z = (x + y)
      x = y
      y = z
    end

    return y
  end
end
