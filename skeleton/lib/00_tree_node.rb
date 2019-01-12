require 'byebug'

class PolyTreeNode

    attr_reader :children, :value
    attr_accessor :parent

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(node_parent)
        # debugger
        self.parent.children.delete(self) if self.parent

        @parent = node_parent

        node_parent.children << self if node_parent
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "Has no parent" if child_node.parent == nil
        child_node.parent = nil
    end

    def dfs(target)
        # p "parent: #{self.parent} children: #{self.children} self value: #{self.value}"
        return self if target == self.value
        # debugger
        self.children.each do |child| #parent b, bypasses d, e returns e
            memo = child.dfs(target)
            return memo if memo
        end

        nil
    end

    def bfs(target)
        queue = [self]

        until queue.empty?
            root = queue.shift
            return root if root.value == target
            queue += root.children
        end

        nil
    end

    def inspect
        p "children: #{self.children}; value: #{self.value}"
    end
end