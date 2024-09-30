# frozen_string_literal: false

require './lib/binary_search_tree'

tree = Tree.new
arr = [12, 69, 45, 31, 69, 42]
p tree.build_tree(arr)
tree.pretty_print
tree.insert(62)
tree.pretty_print
tree.delete(45)
tree.pretty_print
tree.find(12)
p tree.find(30)
