module DirectedGraph

  class Edge

    attr_reader :origin_vertex, :destination_vertex, :value

    def initialize(origin_vertex, destination_vertex, value = nil)
      @origin_vertex = origin_vertex
      @destination_vertex = destination_vertex
      @value = value
    end

  end


end

