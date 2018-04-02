require "minitest/autorun"
require_relative "sorting"

class SortingTest < Minitest::Test
  def expected
    [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
  end

  def input
    [ 5, 9, 2, 1, 3, 4, 6, 8, 7 ]
  end

  def test_it_performs_bubble_sort
    # Time Complexity O(n**2)
    assert_equal expected, Sorting.bubble_sort(input)
  end

  def test_it_performs_selection_sort
    # Time Complexity O(n**2)
    assert_equal expected, Sorting.selection_sort(input)
  end

  def test_it_performs_insertion_sort
    # Time Complexity O(n**2)
    assert_equal expected, Sorting.insertion_sort(input)
  end

  def test_it_performs_quicksort
    # Time Complexity O(n log(n))
    assert_equal expected, Sorting.quick_sort(input)
  end

  def test_it_performs_merge_sort
    # Time Complexity O(n log(n))
    assert_equal expected, Sorting.merge_sort(input)
  end
end
