# frozen_string_literal: false

## The building block for any binary search tree
class Node
  attr_accessor :left, :right
  attr_reader :data

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

## The faithful recreation of a binary search tree by user Profiremu23
class Tree
  attr_reader :root

  def initialize
    @root = nil
  end

  def build_tree(array, starting_point = array.find_index(array.first), end_point = array.find_index(array.last))
    return nil if array.class != Array || starting_point > end_point
    array.sort!
    array.uniq!

    middle_point = (starting_point + end_point) / 2

    node = Node.new(array[middle_point])
    node.left = build_tree(array, starting_point, middle_point - 1)
    node.right = build_tree(array, middle_point + 1, end_point)

    @root = node
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    unless node.nil?
      pretty_print(node.right, "#{prefix}#{is_left ? '|   ' : '    '}", false)
      puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
      pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '|   '}", true)
    end
  end
end
