# frozen_string_literal: false

require './lib/binary_search_tree'

tree = Tree.new
arr = [12, 69, 45, 31, 69, 42]
p tree.build_tree(arr)
p tree.pretty_print(node = @root, prefix = '', is_left: true)
