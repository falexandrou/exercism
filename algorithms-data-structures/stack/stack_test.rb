require "minitest/autorun"
require_relative "stack"

class StackTest < Minitest::Test
  def test_it_pushes_an_item
    s = Stack.new
    s.push 5
    assert_equal [5], s.items
  end

  def test_it_pushes_more_than_1_items
    s = Stack.new
    s.push 5
    s.push 6
    s.push 7
    s.push 8
    s.push 9
    s.push 10
    assert_equal [10, 9, 8, 7, 6, 5], s.items
  end

  def test_it_peeks
    s = Stack.new
    s.push 5

    assert_equal 5, s.peek

    s.push 6
    assert_equal 6, s.peek

    s.push 7
    assert_equal 7, s.peek
  end

  def test_it_doesnt_pop_empty_stack
    s = Stack.new
    assert_equal false, s.pop
  end

  def test_it_pops_item
    s = Stack.new
    s.push 5
    s.push 6
    s.push 7

    assert_equal 7, s.pop
    assert_equal 6, s.pop
    assert_equal 5, s.pop
  end

  def test_it_returns_length
    s = Stack.new
    s.push 5
    s.push 6
    s.push 7
    s.push 8

    assert_equal 4, s.length

    s.pop
    assert_equal 3, s.length

    s.pop
    assert_equal 2, s.length

    s.pop
    assert_equal 1, s.length

    s.pop
    assert_equal 0, s.length
  end

  def test_it_returns_whether_empty
    s = Stack.new
    assert_equal true, s.empty?

    s.push 5
    assert_equal false, s.empty?

    s.pop
    assert_equal true, s.empty?
  end
end
