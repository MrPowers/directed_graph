#require 'builder'

module DirectedGraph
  class Graph

    # Generate a string key from an array of identifiers
    def compute_key(external_identifier)
      x = [external_identifier].flatten
      x.map! {|xx| xx.to_s}
      x.join("_")
    end

    # Return graph as graphml text
    def to_graphml()
      builder = Builder::XmlMarkup.new(:indent => 1)
      builder.instruct! :xml, :version => "1.0"

      graphml_attribs = {
        "xmlns" => "http://graphml.graphdrawing.org/xmlns",
        "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance",
        "xmlns:y" => "http://www.yworks.com/xml/graphml",
        "xmlns:yed" => "http://www.yworks.com/xml/yed/3",
        "xsi:schemaLocation" => "http://graphml.graphdrawing.org/xmlns http://www.yworks.com/xml/schema/graphml/1.1/ygraphml.xsd",
        :directed => "1",
        :label => "test"
      }

      builder.graphml(graphml_attribs) do

        # Define key id's at top of graphml file
        builder.key({:for=>"node", :id=>"d3", "yfiles.type"=>"nodegraphics"})

        # Build Graph 
        #
        builder.graph({:id=>"G"}) do

          vertices.each do |vertex|

            builder.node(:id => compute_key([vertex.name, vertex.object_id])) do

              builder.data({:key=>"d3"}) do
                builder.tag!("y:ShapeNode") do

                  graphics = vertex.data.fetch(:graphics, {})
                  graphics.fetch(:fill, []).each    {|f| builder.tag! "y:Fill",    {:color=>f, :transparent=>"false"}}
                  graphics.fetch(:shape,[]).each    {|s| builder.tag! "y:Shape",   {:type=>s}}
                  graphics.fetch(:geometry,[]).each {|s| builder.tag! "y:Geometry", s}
                  graphics.fetch(:label,[]).each    {|l| builder.tag! "y:NodeLabel", l}
                end
              end
            end
          end

          edges.each do |edge|
            source = edge.origin_vertex
            target = edge.destination_vertex

            options = edge.data[:options]
            label   = ""

            builder.edge(
              :source => s = compute_key([source.name, source.object_id]), 
              :target => t = compute_key([target.name, target.object_id]), 
              :id => compute_key([source.name, target.name, edge.object_id]),
              :label => "#{label}"
            ) do
              #edge[:attributes].each_pair { |k, v| 
              #  id_str = compute_key([k,:edge_attr])
              #  builder.data(v.to_s, {:key=>@guid[id_str]})
              #}
            end
          end
        end
      end
      builder.target!
    end
  end
end
