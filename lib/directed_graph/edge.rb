module DirectedGraph

  class Edge

    attr_reader :origin_vertex, :destination_vertex
    attr_accessor :data

    def initialize(args)
      @origin_vertex = args.fetch(:origin_vertex)
      @destination_vertex = args.fetch(:destination_vertex)
      @data = args.fetch(:data, {})
    end

  end


end

