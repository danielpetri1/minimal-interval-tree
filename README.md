# minimal-interval-tree
A simple Ruby implementation of the interval tree provided as pseudocode in the book "Computational Geometry: Algorithms and Applications" by Marc van Kreveld, Mark de Berg, and Otfried Cheong.

A set of **closed** intervals can be queried at a certain stabbing point, returning all intervals containing it.

```ruby
require_relative 'lib/IntervalTree'

ChessPlayers = Struct.new(:begin, :end, :value)

titled_players = [

ChessPlayers.new(1995, 2022, 'Alexandra Botez'),
ChessPlayers.new(1943, 2008, 'Bobby Fischer'),
ChessPlayers.new(1987, 2022, 'Hikaru Nakamura'),
ChessPlayers.new(1888, 1942, 'José Raúl Capablanca'),
ChessPlayers.new(1990, 2022, 'Magnus Carlsen'),
ChessPlayers.new(1862, 1934, 'Siegbert Tarrasch'),
]

tree = IntervalTree.new(titled_players)
puts tree.query_interval_tree(1900)

# Output
# <struct ChessPlayers begin=1862, end=1934, value="Siegbert Tarrasch">
# <struct ChessPlayers begin=1888, end=1942, value="José Raúl Capablanca">
```
