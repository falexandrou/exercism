class Vertex
  attr_accessor :name, :adjacents

  def initialize name
    @name = name
    @adjacents = []
  end
end

class Graph
  attr_accessor :vertices

  def initialize
    @vertices = []
  end

  def add_vertex name
    @vertices << Vertex.new(name)
  end

  def add_edge(a, b)
    from = @vertices.index { |v| v.name == a }
    to   = @vertices.index { |v| v.name == b }

    @vertices[from].adjacents[to] = true
  end

  def has_edge? a, b
    from = @vertices.index { |v| v.name == a }
    to   = @vertices.index { |v| v.name == b }

    @vertices[from].adjacents[to]
  end

  def breath_first_search
  end

  def depth_first_search
  end
end
