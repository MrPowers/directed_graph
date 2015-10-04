require 'spec_helper'

module DirectedGraph; describe JobRunner do

  context ".sorted_vertices" do
    it "organizes the vertices by order of execution" do
      vertices_and_children = [
        ["human_lab_data", ["kids", "american", "seniors"]],
        ["kids", ["kids_with_american_parents"]],
        ["seniors", ["senior_americans"]],
        ["senior_americans", []],
        ["american", ["american_parent_has", "senior_americans"]],
        ["american_parent_has", ["kids_with_american_parents"]],
        ["kids_with_american_parents", []]
      ]
      expected = ["human_lab_data", "seniors", "american", "senior_americans", "american_parent_has", "kids", "kids_with_american_parents"]
      expect(JobRunner.sorted_vertices(vertices_and_children)).to eq expected
    end
  end

end; end

