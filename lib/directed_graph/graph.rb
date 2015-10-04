module DirectedGraph

  class Graph

    attr_reader :edges

    def initialize(edges)
      @edges = edges
    end

    def vertices
      r = []
      edges.each {|e| r.push(e.origin_vertex, e.destination_vertex)}
      r.uniq
    end

    def ordered_edges
      sorted_vertices.inject([]) do |memo, v|
        edge = edges.select {|e| e.destination_vertex == v}
        memo.push(*edge) if edge
        memo
      end
    end

    def sorted_vertices
      JobRunner.sorted_vertices(vertices_and_children)
    end

    def children(vertex)
      edges.select {|e| e.origin_vertex == vertex}.map{|e| e.destination_vertex}
    end

    def vertices_and_children
      vertices.map {|v| [v, children(v)]}
    end

  end

end

