require 'pry'
require 'set'

$posx = 0
$posy = 0
$dir = %w{n e s w}
$moves = []
$visited = Set.new

def turn(turn_dir)
  if turn_dir == 'R'
    $dir.rotate!
  else
    $dir.rotate!(-1)
  end
end

def move(dist)
  dir = $dir.first
  dist.times do
    if dir == 'n'
      $posy += 1
    elsif dir == 'e'
      $posx += 1
    elsif dir == 's'
      $posy -= 1
    elsif dir == 'w'
      $posx -= 1
    end
    if $visited.include?([$posx, $posy])
      puts $posx.abs + $posy.abs
      break
    else
      $visited << [$posx, $posy]
    end
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
