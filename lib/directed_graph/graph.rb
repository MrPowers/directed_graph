module DirectedGraph

  class Graph

    attr_reader :edges

    def initialize(edges = [])
      @edges = edges
    end

    def vertices
      r = []
      edges.each {|e| r.push(e.origin_vertex, e.destination_vertex)}
      r.uniq {|e| e.object_id}
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

    def longest_path(origin_vertex_name, destination_vertex, result = [])
      return [destination_vertex] + result if origin_vertex_name == destination_vertex.name
      parents(destination_vertex).map do |v|
        longest_path(origin_vertex_name, v, [destination_vertex] + result)
      end.inject([]) {|m, arr| m = arr if arr.length > m.length; m}
    end

    def children(vertex)
      edges.select {|e| e.origin_vertex.name == vertex.name}.map{|e| e.destination_vertex}
    end

    def parents(vertex)
      edges.select {|e| e.destination_vertex.name == vertex.name}.map{|e| e.origin_vertex}
    end

    private

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

