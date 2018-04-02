require "minitest/autorun"
require_relative "linked_list"

class LinkedListTest < Minitest::Test
  def test_it_adds_an_item
    l = LinkedList.new(4)
    assert_equal 4, l.head.value
  end

  def test_it_adds_more_nodes
    l = LinkedList.new(5)
    l.add 6

    assert_equal 5, l.head.value
    assert_equal 6, l.head.next.value
  end

  def test_it_returns_nodes
    l = LinkedList.new(5)
    l.add 6
    l.add 7
    assert_equal [5, 6, 7], l.nodes
  end

  def test_it_removes_node
    l = LinkedList.new(5)
    l.add 6
    l.add 7
    l.add 8
    l.add 9
    l.add 10

    assert_equal true, l.remove(6)
    assert_equal [5, 7, 8, 9, 10], l.nodes

    l.remove(7)
    l.remove(8)
    assert_equal [5, 9, 10], l.nodes
  end

  def test_it_removes_the_head_node
    l = LinkedList.new(5)
    l.add 6
    l.add 7
    l.add 8
    l.add 9
    l.add 10

    assert_equal true, l.remove(5)
    assert_equal [6, 7, 8, 9, 10], l.nodes
    assert_equal 6, l.head.value
  end
end
