require 'tsort'

module DirectedGraph; class JobRunner

  def self.sorted_vertices(vertices_and_children)
    runner = JobRunner.new
    vertices_and_children.each { |v, c| runner.add(v, c) }
    runner.tsort.reverse
  end

  include TSort

  def initialize
    @jobs = Hash.new{|h,k| h[k] = []}
  end

  def add(name, dependencies=[])
    @jobs[name] = dependencies
  end

  def tsort_each_node(&block)
    @jobs.each_key(&block)
  end

  def tsort_each_child(node, &block)
    @jobs[node].each(&block) if @jobs.has_key?(node)
  end

end; end

