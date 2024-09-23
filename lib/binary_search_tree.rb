# frozen_string_literal: false

## The building block for any binary search tree
class Node
  attr_writer :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

## The faithful recreation of a binary search tree by user Profiremu23
class Tree
  def array_to_bst(array, starting_point = array.find_index(array.first), end_point = array.find_index(array.last))
    return nil if array.class != Array || starting_point > end_point

    middle_point = (starting_point + end_point) / 2

    node = Node.new(array[middle_point])
    node.left = array_to_bst(array, starting_point, middle_point - 1)
    node.right = array_to_bst(array, middle_point + 1, end_point)

    p node
  end
end
