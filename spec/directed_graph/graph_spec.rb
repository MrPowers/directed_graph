require 'spec_helper'

module DirectedGraph; describe Graph do

  before do
    @ra = Edge.new("root", "a")
    @ab = Edge.new("a", "b")
    @bc = Edge.new("b", "c")
    @bd = Edge.new("b", "d")
    @ae = Edge.new("a", "e")
    @de = Edge.new("d", "e")
    @edges = [@ra, @ab, @bc, @bd, @ae, @de]
    @graph = Graph.new(@edges)
  end

  context "#vertices" do
    it "creates an array of the vertices from the edges" do
      expect(@graph.vertices).to match_array %w|root a b c d e|
    end
  end

  context "#children" do
    it "returns the children of a vertex" do
      expect(@graph.children("a")).to match_array %w|b e|
    end
  end

  context "#sorted_vertices" do
    it "topologically sorts the vertices" do
      expected = ["root", "a", "b", "d", "e", "c"]
      expect(@graph.sorted_vertices).to eq expected
    end
  end

  context "#vertices_and_children" do
    it "returns the vertices and their children vertices" do
      expected = [["root", ["a"]], ["a", ["b", "e"]], ["b", ["c", "d"]], ["c", []], ["d", ["e"]], ["e", []]]
      expect(@graph.vertices_and_children).to eq expected
    end
  end

  context "#ordered_edges" do
    it "orders the edges by the topologically sorted vertices" do
      expected = [@ra, @ab, @bd, @ae, @de, @bc]
      expect(@graph.ordered_edges).to eq expected
    end
  end

end; end

