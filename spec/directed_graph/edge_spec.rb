require 'spec_helper'

module DirectedGraph; describe Edge do

  context ".new" do
    it "allows an Edge object to be created" do
      Edge.new(origin_vertex: "origin_vertex", destination_vertex: "destination_vertex", value: "value")
    end
  end

end; end

