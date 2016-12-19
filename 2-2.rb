require 'pry'
require 'set'

$PAD =
"""
    1
  2 3 4
5 6 7 8 9
  A B C
    D
""".split("\n").map { |l| l.chars.each_slice(2).map(&:first) }
$posx = 3
$posy = 0

def move(dir)
  startx = $posx
  starty = $posy
  if dir == 'u'
    $posx -= 1
  elsif dir == 'l'
    $posy -= 1
  elsif dir == 'd'
    $posx += 1
  elsif dir == 'r'
    $posy += 1
  end
  $posx = [0,$posx].max
  $posy = [0,$posy].max
  begin
    final = $PAD[$posx][$posy]
  rescue NoMethodError
    final = nil
  end
  if final == ' ' || final.nil?
    $posx = startx
    $posy = starty
  end
end

File.readlines("2.data").each_with_index do |line, i|
  line.downcase.chars.each do |c|
    move(c)
    #puts "#{c}#{$PAD[$posx][$posy]}"
  end
  puts $PAD[$posx][$posy]
end
