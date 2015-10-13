module DirectedGraph

  class Vertex

    attr_reader :name
    attr_accessor :data

    def initialize(name)
      @name = name
    end

  end

end


Vertex:
  - Uniq Id
  - Data (hash of arbitrary data)
  - Children Edges
