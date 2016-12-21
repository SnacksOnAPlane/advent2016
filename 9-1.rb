require 'pry'
require 'set'

File.readlines("9.data").each_with_index do |line, i|
  retme = ''
  line.chomp!
  while !line.empty?
    match = line.match(/\((\d+x\d+)\)/)
    if match
      count,times = match[1].split('x').map(&:to_i)
      repeat_text = line[match.end(0),count]
      retme += line[0, match.begin(0)]
      retme += repeat_text * times
      line = line[match.end(0) + count..-1]
    else
      retme += line
      line = ''
    end
  end
  puts retme
  puts retme.length
end


