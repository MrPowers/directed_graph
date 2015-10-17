module DirectedGraph

  class Vertex

    attr_reader :name
    attr_accessor :data

    def initialize(args)
      @name = args.fetch(:name)
      @data = args.fetch(:data, {})
    end

  end

end

