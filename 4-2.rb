require 'pry'
require 'set'

$count = 0

def sorter(a, b)
  if a.last != b.last
    b.last <=> a.last
  else
    a.first <=> b.first
  end
end

def rot(amt, text)
  alphabet = ("a".."z").to_a
  key = Hash[alphabet.zip(alphabet.rotate(amt))]
  text.each_char.inject("") { |encrypted, char| encrypted + key[char] }
end

def real_room(letters, checksum)
  counts = letters.each_with_object(Hash.new(0)) { |letter,count| count[letter] += 1 }
  counts = counts.sort{|a,b| sorter(a,b)}.take(5)
  answer = counts.map(&:first).join('')
  answer == checksum
end

File.readlines("4.data").each_with_index do |line, i|
  parts = line.split("[")
  checksum = parts.last.chomp("]\n")
  parts = parts.first.split("-")
  id = parts.last.to_i
  letters = parts[0...-1].join('').chars
  if real_room(letters, checksum)
    shift = id % 26
    puts rot(shift, parts[0...-1].join('')), id
  end
end

puts $count
