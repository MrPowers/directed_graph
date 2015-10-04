require 'spec_helper'

module DirectedGraph; describe Edge do

  context ".new" do
    it "allows an Edge object to be created" do
      Edge.new("origin_vertex", "destination_vertex", "value")
    end
  end

end; end

