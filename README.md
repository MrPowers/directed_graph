# directed_graph

The directed_graph gem is useful for modeling directed, acyclic, unweighted graphs.  It provides methods to topologically sort graphs, find the shortest path between two vertices, and render the graphs and json for client-side graphing.

The following graph will be used to demonstrate the functionality of the directed_graph gem.

![graph_example](https://github.com/MrPowers/directed_graph/blob/master/example/simple_directed_graph.png)

The `Graph` class should be instantiated with an array of edges:

```ruby
# The first argument is the origin_vertex
# and the second is the destination_vertex
@ra = Edge.new("root", "a")
@ab = Edge.new("a", "b")
@bc = Edge.new("b", "c")
@bd = Edge.new("b", "d")
@ae = Edge.new("a", "e")
@de = Edge.new("d", "e")
@edges = [@ra, @ab, @bc, @bd, @ae, @de]
@graph = Graph.new(@edges)
```

The `@graph` object can be used to get a topological sorted array of the vertices:

```ruby
@graph.sorted_vertices # ["root", "a", "b", "d", "e", "c"]
```

The `@graph` object can also be used to calculate the shortest path between two vertices:

```ruby
@graph.shortest_path("root", "e")) # %w|root a e|
@graph.shortest_path("root", "blah")) # nil because the "blah" vertex doesn't exist
@graph.shortest_path("d", "a")) # nil because the graph is directed and can't be traversed in the wrong direction
```


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'directed_graph'
```

Require the gem in your code:

```ruby
require 'directed_graph'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/MrPowers/directed_graph.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

