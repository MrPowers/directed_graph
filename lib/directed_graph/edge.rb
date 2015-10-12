module DirectedGraph

  class Edge

    attr_reader :origin_vertex, :destination_vertex, :value

    def initialize(args)
      @origin_vertex = args.fetch(:origin_vertex)
      @destination_vertex = args.fetch(:destination_vertex)
      @value = args.fetch(:value, nil)
    end

  end


end

