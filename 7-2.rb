require 'pry'
require 'set'

$count = 0

def num_char_seq(num, str)
  (0..(str.length-num)).each do |i|
    yield str[i...(i+num)]
  end
end

def abba?(str)
  num_char_seq(4, str) do |fqs|
    if fqs[0] == fqs[3] && fqs[1] == fqs[2] && fqs[0] != fqs[1]
      return true
    end
  end
  return false
end

def abas(str)
  retme = []
  num_char_seq(3,str) do |tcs|
    if tcs[0] == tcs[2] && tcs[0] != tcs[1]
      retme << tcs
    end
  end
  return retme
end

def flip(str)
  retme = "   "
  retme[0] = retme[2] = str[1]
  retme[1] = str[0]
  retme
end

File.readlines("7.data").each_with_index do |line, i|
  line = line.chomp
  add = false
  in_brackets = line.scan(/\[([a-z]+)\]/).map(&:first)
  outside_brackets = line.split(/\[[a-z]+\]/)
  outside_brackets.each do |str|
    abas(str).each do |aba|
      add = true if in_brackets.any? { |s2| s2[flip(aba)] }
    end
  end
  if add
    $count += 1
  end
end

puts $count
