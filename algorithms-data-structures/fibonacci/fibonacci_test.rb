require 'minitest/autorun'
require_relative 'fibonacci'

class FibonacciTest < Minitest::Test
  def test_it_returns_0_for_0
    fib = Fibonacci.new
    assert_equal 0, fib.seq(0)
  end

  def test_it_returns_1_for_1
    fib = Fibonacci.new
    assert_equal 1, fib.seq(1)
  end

  def test_it_returns_1_for_2
    fib = Fibonacci.new
    assert_equal 1, fib.seq(2)
  end

  def test_it_returns_2_for_3
    fib = Fibonacci.new
    assert_equal 2, fib.seq(3)
  end

  def test_it_returns_13_for_7
    fib = Fibonacci.new
    assert_equal 13, fib.seq(7)
  end

  def test_it_returns_6765_for_20
    fib = Fibonacci.new
    assert_equal 6_765, fib.seq(20)
  end

  def test_iterative_returns_13_for_7
    fib = Fibonacci.new
    assert_equal 13, fib.iterative(7)
  end

  def test_iterative_returns_6765_for_20
    fib = Fibonacci.new
    assert_equal 6_765, fib.iterative(20)
  end
end
