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

  context "#shortest_path" do
    it "returns an array of the shortest path between vertices" do
      expect(@graph.shortest_path("root", "e")).to eq %w|root a e|
    end

    it "returns nil when there is no path between two vertices" do
      expect(@graph.shortest_path("root", "blah")).to eq nil
    end

    it "returns nil when the path is in the wrong direction (this is a directed graph)" do
      expect(@graph.shortest_path("d", "a")).to eq nil
    end
  end

  context "#vertices" do
    it "creates an array of the vertices from the edges" do
      expect(@graph.vertices).to match_array %w|root a b c d e|
    end
  end

  context "#children" do
    it "returns the children of a vertex" do
      expect(@graph.send(:children, "a")).to match_array %w|b e|
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
      expect(@graph.send(:vertices_and_children)).to eq expected
    end
  end

  context "#ordered_edges" do
    it "orders the edges by the topologically sorted vertices" do
      expected = [@ra, @ab, @bd, @ae, @de, @bc]
      expect(@graph.ordered_edges).to eq expected
    end
  end

end; end

