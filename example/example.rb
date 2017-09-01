require 'minitest/autorun'
require 'color-generator'
require 'directed_graph'  #This is an external gem

include DirectedGraph

class BugTest < Minitest::Test
  def test_two()

    # Create the Vertices
    #
    @root = Vertex.new(name: "root")
    @a = Vertex.new(name: "a")
    @b = Vertex.new(name: "b")
    @c = Vertex.new(name: "c")
    @d = Vertex.new(name: "d")
    @e = Vertex.new(name: "e")

    # Create the Edges
    #
    # The first argument is the origin_vertex
    # and the second is the destination_vertex
    @ra = Edge.new(origin_vertex: @root, destination_vertex: @a)
    @ab = Edge.new(origin_vertex: @a, destination_vertex: @b)
    @bc = Edge.new(origin_vertex: @b, destination_vertex: @c)
    @bd = Edge.new(origin_vertex: @b, destination_vertex: @d)
    @ae = Edge.new(origin_vertex: @a, destination_vertex: @e)
    @de = Edge.new(origin_vertex: @d, destination_vertex: @e)

    # Create the Graph
    #
    @edges = [@ra, @ab, @bc, @bd, @ae, @de]
    @graph = Graph.new(@edges)

    # Set the color of the vertexes 
    #
    @generator = ColorGenerator.new saturation: 0.3, lightness: 0.75

    @graph.vertices.each do |vertex|
      label = vertex.name
      color = @generator.create_hex

      vertex.data[:graphics]  = {:fill=>["##{color}"], :label=>[label], :group=>color}
    end

    # Generate a graphml file
    # Import this file into program like yEd to size nodes and layout graph
    #
    filename = "example_graph"

    txt = @graph.to_graphml()

    File.open("#{filename}.graphml", "w+") { |f| f.write(txt)}
  end
end



