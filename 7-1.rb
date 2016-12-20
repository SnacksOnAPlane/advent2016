require 'pry'
require 'set'

$count = 0

def four_char_seq(str)
  (0...(str.length-3)).each do |i|
    yield str[i..(i+3)]
  end
end

def abba?(str)
  four_char_seq(str) do |fqs|
    if fqs[0] == fqs[3] && fqs[1] == fqs[2] && fqs[0] != fqs[1]
      puts fqs
      return true
    end
  end
  return false
end

File.readlines("7.data").each_with_index do |line, i|
  in_brackets = line.scan(/\[([a-z]+)\]/).map(&:first)
  outside_brackets = line.split(/(\[[a-z]+\])/)
  if outside_brackets.any? { |str| abba?(str) } && !in_brackets.any? { |str| abba?(str) }
    $count += 1
  end
end

puts $count
