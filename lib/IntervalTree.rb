#!/usr/bin/env ruby
require_relative 'TreeNode'

class IntervalTree

    def initialize(i)
        @v = construct_interval_tree(i)
    end
    attr_reader :v

    # @param q_x: query point q_x
    # @param v: root of an interval tree
    # @param res: result
    def query_interval_tree(q_x, v = self.v, res = [])
        return res if v.nil?

        if q_x < v.x_mid
            v.l_left.each do |interval|
                break if q_x < interval.begin 
                res << interval
            end
            query_interval_tree(q_x, v.i_left, res)
        else
            v.l_right.each do |interval|
                break if q_x > interval.end
                res << interval
            end
            query_interval_tree(q_x, v.i_right, res)
        end
    end

    private

    # @param i: array of intervals
    # Output: median of the 2n interval endpoints
    def compute_median(i)
        i = i.flat_map { |i| [i.begin, i.end] }.sort
        (i[(i.length - 1) / 2] + i[i.length / 2]) / 2.0
    end

    # @param i: array of intervals
    # Output: root v of an interval tree for the intervals i
    def construct_interval_tree(i)
        
        # Return an empty leaf node if i is empty
        return nil if i.empty?

        # Compute x_mid
        x_mid = compute_median(i)

        # Compute i_left, i_mid, i_right
        i_left, i_mid, i_right = [], [], []

        i.each do |interval|
            if (interval.end < x_mid) 
                i_left << interval
            elsif (x_mid < interval.begin)
                i_right << interval
            else i_mid << interval
            end
        end

        # Determine l_left by sorting on left interval endpoints
        l_left = i_mid.sort_by { |interval| interval.begin }

        # Compute l_right by sorting on right interval endpoints
        l_right = i_mid.sort_by { |interval| interval.end }.reverse

        # Create new node
        Node.new(x_mid, l_left, l_right, construct_interval_tree(i_left), construct_interval_tree(i_right))
    end
end
