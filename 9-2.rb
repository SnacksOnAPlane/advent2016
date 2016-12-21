require 'pry'
require 'set'
require 'strscan'

class Node
  attr_accessor :repeat
  attr_accessor :text_length

  def initialize(repeat, text)
    @repeat = repeat
    @text_length = 0
    parse_text(text)
  end

  def parse_text(text)
    @children = []
    s = StringScanner.new(text)
    while !s.eos?
      start = s.scan(/\w*/)
      @text_length += start.length if start
      rep = s.scan(/\((\d+x\d+)\)/)
      if rep
        count,times = s[1].split('x').map(&:to_i)
        rest = s.scan(/.{#{count}}/)
        n = Node.new(times, rest)
        @children << n
      end
    end
  end

  def length
    @repeat * (@children.inject(0) { |sum,c| sum + c.length } + @text_length)
  end
end

$nodes = []

File.readlines("9.data").each_with_index do |line, i|
  line.chomp!
  n = Node.new(1, line)
  puts line
  puts n.length
end
