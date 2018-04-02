require "minitest/autorun"
require_relative "graph"

class GraphTest < Minitest::Test
  def test_it_creates_a_node_in_a_graph
    g = Graph.new
    g.add_vertex :a

    assert_equal [:a], g.vertices.map(&:name)
  end

  def test_it_creates_an_edge
    g = Graph.new
    g.add_vertex :a
    g.add_vertex :b

    g.add_edge :a, :b
    assert_equal true, g.vertices.find {|v| v.name == :a}.adjacents[g.vertices.index {|v| v.name == :b}]
  end
end
