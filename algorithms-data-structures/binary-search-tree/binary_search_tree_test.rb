require 'minitest/autorun'
require_relative 'binary_search_tree'

module Helpers
  module Let
    def let(name, &blk)
      define_method name do
        @let_assigments ||= {}
        @let_assigments[name] ||= send(:"original_#{name}")
      end
      define_method "original_#{name}", &blk
    end
  end
end

class BinarySearchTreeTest < Minitest::Test
  extend Helpers::Let

  let(:bintree) do
    tree = BinarySearchTree.new(5)
    tree.insert(3)
    tree.insert(6)
    tree.insert(1)
    tree.insert(4)
    tree
  end

  let(:not_a_bintree) do
    tree = BinarySearchTree.new(5)
    tree.root.left = Node.new(7)
    tree.root.right = Node.new (9)
    tree
  end

  def test_it_has_a_root_node
    tree = BinarySearchTree.new(10)
    assert_equal 10, tree.root.value
  end

  def test_it_inserts_a_node
    tree = BinarySearchTree.new(10)
    assert_equal 10, tree.root.value

    tree.insert(5)
    assert_equal 5, tree.root.left.value
  end

  def test_it_inserts_another_node
    tree = BinarySearchTree.new(10)
    assert_equal 10, tree.root.value

    tree.insert(5)
    assert_equal 5, tree.root.left.value

    tree.insert(15)
    assert_equal 15, tree.root.right.value
  end

  def test_it_inserts_yet_another_couple_of_nodes
    tree = BinarySearchTree.new(5)
    assert_equal 5, tree.root.value

    tree.insert(3)
    assert_equal 3, tree.root.left.value

    tree.insert(6)
    assert_equal 6, tree.root.right.value

    tree.insert(1)
    assert_equal 1, tree.root.left.left.value

    tree.insert(4)
    assert_equal 4, tree.root.left.right.value
  end

  def test_it_inserts_a_node_recursively
    tree = BinarySearchTree.new(10)
    assert_equal 10, tree.root.value

    tree.insert_recursive 5
    assert_equal 5, tree.root.left.value
  end

  def test_it_inserts_yet_another_couple_of_nodes_recursively
    tree = BinarySearchTree.new(5)
    assert_equal 5, tree.root.value

    tree.insert_recursive 3
    assert_equal 3, tree.root.left.value

    tree.insert_recursive 6
    assert_equal 6, tree.root.right.value

    tree.insert_recursive 1
    assert_equal 1, tree.root.left.left.value

    tree.insert_recursive 4
    assert_equal 4, tree.root.left.right.value
  end

  def test_it_performs_pre_order_traversal
    assert_equal [1, 4, 3, 6, 5], bintree.pre_order_traversal
  end

  def test_it_performs_in_order_traversal
    assert_equal [1, 3, 4, 5, 6], bintree.in_order_traversal
  end

  def test_it_performs_post_order_traversal
    assert_equal [5, 3, 1, 4, 6], bintree.post_order_traversal
  end

  def test_it_returns_the_number_of_nodes
    assert_equal 5, bintree.count
  end

  def test_it_returns_if_the_tree_is_valid
    assert_equal true, bintree.valid?
    assert_equal false, not_a_bintree.valid?
  end

  def test_it_finds_if_a_value_is_contained
    assert_equal true, bintree.contains?(6)
    assert_equal false, bintree.contains?(6879)
  end

  def test_it_clears_the_tree
    tree = BinarySearchTree.new(4)
    assert_equal 4, tree.root.value

    tree.clear!
    assert_nil tree.root
  end

  def test_it_removes_a_node
    bintree.remove(3)
    assert_equal [5, 4, 1, 6], bintree.post_order_traversal
  end
end
