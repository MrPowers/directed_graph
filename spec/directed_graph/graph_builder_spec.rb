require 'spec_helper'

module DirectedGraph; describe GraphBuilder do

  before do
    @graph_builder = GraphBuilder.new
    @graph_builder.add_edge(origin_vertex_name: "root", destination_vertex_name: "a")
    @graph_builder.add_edge(origin_vertex_name: "a", destination_vertex_name: "b")
    @graph_builder.add_edge(origin_vertex_name: "b", destination_vertex_name: "c")
    @graph_builder.add_edge(origin_vertex_name: "b", destination_vertex_name: "d")
    @graph_builder.add_edge(origin_vertex_name: "a", destination_vertex_name: "e")
    @graph_builder.add_edge(origin_vertex_name: "d", destination_vertex_name: "e")
  end

  context "#graph" do
    it "topologically sorts the vertices" do
      expected = []
      expect(@graph_builder.graph.sorted_vertices).to eq expected
    end
  end

end; end

