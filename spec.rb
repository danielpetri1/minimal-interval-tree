require_relative 'lib/IntervalTree'

SomeStruct = Struct.new(:begin, :end, :value)

# With ranges
ranges =  [(0..4), (3..7), (5..9), (6..10)]

# With custom objects
structs = [SomeStruct.new(0, 4, 'Hello'), SomeStruct.new(3, 7, 'World'), SomeStruct.new(5, 9, 'foo'), SomeStruct.new(6, 10, 'bar')]

tree_with_ranges = IntervalTree.new(ranges)
tree_with_structs = IntervalTree.new(structs)

p tree_with_ranges.query_interval_tree(5)
p tree_with_structs.query_interval_tree(5)