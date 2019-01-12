class PolyTreeNode

    attr_reader :parent, :children, :value

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(node_parent)
        node_parent.children << self if !node_parent
        self.parent = node_parent
    end
    
end