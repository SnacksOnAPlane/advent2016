require 'pry'
require 'set'

$count = 0
width = 50
height = 6
$screen = []

height.times do
  $screen << Array.new(width, '.')
end

def fill(x,y)
  (0...y).each do |iy|
    (0...x).each do |ix|
      $screen[iy][ix] = '#'
    end
  end
end

def invert

end

def rotate(row_col,num,by)
  if row_col == 'row'
    $screen[num].rotate!(-by)
  else
    $screen = $screen.transpose
    $screen[num].rotate!(-by)
    $screen = $screen.transpose
  end
end

def display
  $screen.each do |row|
    puts row.join('')
  end
end

File.readlines("8.data").each_with_index do |line, i|
  line.chomp!
  puts line
  parts = line.split
  if parts.first == 'rect'
    x,y = parts[1].split('x').map(&:to_i)
    fill(x,y)
  elsif parts.first == 'rotate'
    row_col = parts[1]
    xy,num = parts[2].split('=')
    num = num.to_i
    by = parts[4].to_i
    rotate(row_col,num,by)
  end
  puts ''
  display
end

$screen.each do |row|
  $count += row.count('#')
end

puts $count

