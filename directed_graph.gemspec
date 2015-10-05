# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'directed_graph/version'

Gem::Specification.new do |spec|
  spec.name          = "directed_graph"
  spec.version       = DirectedGraph::VERSION
  spec.authors       = ["MrPowers"]
  spec.email         = ["matthewkevinpowers@gmail.com"]

  spec.summary       = %q{Modeling directed acyclic graphs}
  spec.description   = %q{Topological sorting, shortest path, and json exports for directed acyclic graphs}
  spec.homepage      = "https://github.com/MrPowers/directed_graph"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"

  spec.add_dependency 'pry'
  spec.add_dependency 'simple-graph'
end
