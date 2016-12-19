require 'pry'
require 'set'

$PAD = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]
$posx = 1
$posy = 1

def move(dir)
  if dir == 'u'
    $posx -= 1
  elsif dir == 'l'
    $posy -= 1
  elsif dir == 'd'
    $posx += 1
  elsif dir == 'r'
    $posy += 1
  end
  $posx = [2, $posx].min
  $posx = [0, $posx].max
  $posy = [2, $posy].min
  $posy = [0, $posy].max
end

File.readlines("2.data").each_with_index do |line, i|
  line.downcase.chars.each do |c|
    move(c)
  end
  puts $PAD[$posx][$posy]
end
