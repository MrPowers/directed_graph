module DirectedGraph

  class GraphBuilder
    # makes it easy to build a directed graph from edges with vertex names
    # builder = GraphBuilder.new(optional_array_of_edges)
    # builder.add_edge(origin_vertex_name: "root", desination_vertex_name = "a", value = "something")
    # builder.graph

    attr_reader :edges

    def initialize(edges = [])
      @edges = edges
    end

    def graph
      Graph.new(edges)
    end

    def vertices
      r = []
      edges.each {|e| r.push(e.origin_vertex, e.destination_vertex)}
      r.uniq {|e| e.object_id}
    end

    def vertex_first_or_create(vertex_name)
      v = vertices.find {|vertex| vertex.name == vertex_name}
      return v if v
      Vertex.new(name: vertex_name)
    end

    def add_edge(args)
      origin_vertex_name = args.fetch(:origin_vertex_name)
      destination_vertex_name = args.fetch(:destination_vertex_name)
      value = args.fetch(:value, nil)
      origin_vertex = vertex_first_or_create(origin_vertex_name)
      destination_vertex = vertex_first_or_create(destination_vertex_name)
      @edges << Edge.new(origin_vertex: origin_vertex, destination_vertex: destination_vertex, value: value)
    end

  end

end

