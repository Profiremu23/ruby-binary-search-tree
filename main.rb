# frozen_string_literal: false

require './lib/binary_search_tree'

tree = Tree.new
arr = [12, 45, 31, 69, 42]
p tree.array_to_bst(arr)
