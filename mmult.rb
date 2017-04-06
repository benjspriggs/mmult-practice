#!/usr/bin/env ruby
require 'matrix'

# make a rando matrix of rows and columns
def generate_matrix(rows, columns, min = 0, max = 10)
  Matrix::build(rows, columns) { |_, __| rand(min..max) }
end

# ask for nums on stdin
def ask()
  pattern = /-?\d+/
  resp = gets
  # convert to numbers
  nums = resp.scan(pattern).map { |n| n.to_i }
end

# ask for row-wise matrix on stdin
def ask_matrix(rows, columns)
  accl = []
  while accl.length < rows * columns do
    accl.concat ask
  end
  Matrix::build(rows, columns) do |r, c|
    accl[ c + r * rows ]
  end
end

# print a pair of row-wise matrices
def pretty_pair(m, n)
  m.to_a.zip(n.to_a).map { |f, s| puts "#{f}\t\t#{s}"}
end

done = false
while !done do
  a = generate_matrix(2, 2)
  b = generate_matrix(2, 2)
  puts "first\t\tsecond"
  pretty_pair a, b
  resp = ask_matrix(2, 2)
  puts "ans\t\tresponse"
  pretty_pair a * b, resp
  done = true
end
