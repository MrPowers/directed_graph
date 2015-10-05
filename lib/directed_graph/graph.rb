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

    def shortest_path(origin_vertex, destination_vertex)
      simple_graph.shortest_path(origin_vertex, destination_vertex)
    end

    private

    def children(vertex)
      edges.select {|e| e.origin_vertex == vertex}.map{|e| e.destination_vertex}
    end

    def vertices_and_children
      vertices.map {|v| [v, children(v)]}
    end

    def simple_graph
      graph = SimpleGraph::Graph.new
      vertices.each do |v|
        graph.add_vertex(v)
      end
      edges.each do |e|
        graph.add_edge(e.origin_vertex, e.destination_vertex)
      end
      graph
    end

  end

end

