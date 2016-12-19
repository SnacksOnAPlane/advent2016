require 'pry'
require 'set'

$count = 0

def can_be_triangle(sides)
  ways = (0..2).to_a.permutation.each do |way|
    if sides[way[0]] + sides[way[1]] <= sides[way[2]]
      return false
    end
  end
  return true
end

$triangles = []
$curr_tri = [[],[],[]]

File.readlines("3.data").each_with_index do |line, i|
  nums = line.split.map(&:to_i)
  (0..2).each { |a| $curr_tri[a] << nums[a] }
  if ((i+1) % 3 == 0)
    $triangles += $curr_tri
    $curr_tri = [[],[],[]]
  end
end
binding.pry

$triangles.each do |sides|
  $count += 1 if can_be_triangle(sides)
end
puts $count
