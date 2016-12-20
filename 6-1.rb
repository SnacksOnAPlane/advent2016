require 'pry'
require 'set'

first = true
$char_pos_counts = []

File.readlines("6.data").each_with_index do |line, i|
  line.chars.each_with_index do |ch, i|
    $char_pos_counts << Hash.new(0) if first
    $char_pos_counts[i][ch] += 1
  end
  first = false
end

val = $char_pos_counts.map { |ct| ct.max_by{|k,v| v}[0] }
puts val.join('')
