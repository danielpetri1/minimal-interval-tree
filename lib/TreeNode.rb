#!/usr/bin/env ruby

class Node
    def initialize(x_mid, l_left, l_right, i_left, i_right)
        # Median of the endpoints of the intervals
        @x_mid = x_mid

        # List of intervals containing x_mid, sorted on their left endpoint
        @l_left = l_left

        # List of intervals containing x_mid, sorted on their right endpoint
        @l_right = l_right

        # Interval tree for the intervals completely to the left of the median
        @i_left = i_left

        # Interval tree for the intervals completely to the right of the median
        @i_right = i_right
    end
    attr_reader :x_mid, :l_left, :l_right, :i_left, :i_right
end
