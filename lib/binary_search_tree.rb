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

  def insert(value, root = @root)
    return Node.new(value) if root.nil?

    return root if root.data == value

    if value < root.data
      root.left = insert(value, root.left)
    else
      root.right = insert(value, root.right)
    end

    root
  end

  def delete(value, root = @root)
    return root if root.nil?

    if root.data > value
      root.left = delete(value, root.left)
    elsif value > root.data
      root.right = delete(value, root.right)
    else
      return root.right if root.left.nil?
      return root.left if root.right.nil?

      successor = Node.new(root)
      root.data = successor.data
      root.right = delete(successor.data, root.right)
    end

    root
  end

  def find(value, root = @root)
    return root if root.nil?

    if root.data > value
      root.left = find(value, root.left)
    else
      root.right = find(value, root.right)
    end

    p root if root.data == value
    nil
  end
end
