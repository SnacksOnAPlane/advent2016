require 'pry'

$posx = 0
$posy = 0
$dir = %w{n e s w}
$moves = []

def turn(turn_dir)
  if turn_dir == 'R'
    $dir.rotate!
  else
    $dir.rotate!(-1)
  end
end

def move(dist)
  dir = $dir.first
  if dir == 'n'
    $posy += dist
  elsif dir == 'e'
    $posx += dist
  elsif dir == 's'
    $posy -= dist
  elsif dir == 'w'
    $posx -= dist
  end
end

File.readlines("1-1.data").each do |line|
  $moves = line.split(', ')
end

$moves.each do |move|
  turn_dir = move[0]
  dist = move[1..-1].to_i
  turn(turn_dir)
  move(dist)
end

puts $posx.abs + $posy.abs
