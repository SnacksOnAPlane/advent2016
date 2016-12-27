require 'pry'
require 'set'

class Output

  def initialize(id)
    @id = id
    @vals = []
  end

  def give(val)
    @vals << val
  end

  def to_s
    "Output #{@id}"
  end
end

class Bot
  attr_accessor :vals

  def initialize(id)
    @id = id
    @vals = []
  end

  def instruct(low, high)
    @low = low
    @high = high
  end

  def give(val)
    @vals << val
    process
  end

  def process
    if @vals.length == 2
      low_val = @vals.min
      high_val = @vals.max
      if low_val == 17 && high_val == 61
        raise "Bot #{@id}"
      end
      puts "Bot #{@id} giving #{low_val} to #{@low} and #{high_val} to #{@high}"
      @low.give(low_val)
      @high.give(high_val)
      @vals = []
    end
  end

  def to_s
    "Bot #{@id}"
  end
end

$bots = Hash.new { |hash, key| hash[key] = Bot.new(key) }
$outputs = Hash.new { |hash, key| hash[key] = Output.new(key) }

def get_receptacle(type, id)
  if type == 'bot'
    $bots[id]
  else
    $outputs[id]
  end
end

File.readlines("10.data").each_with_index do |line, i|
  line.chomp!
  puts line
  match = line.match(/value (\d+) goes to bot (\d+)/)
  $bots[match[2]].vals << match[1].to_i if match

  match = line.match(/bot (\d+) gives low to (\w+) (\d+) and high to (\w+) (\d+)/)
  if match
    low = get_receptacle(match[2], match[3])
    high = get_receptacle(match[4], match[5])
    $bots[match[1]].instruct(low, high)
  end
end

$bots.each do |k,v|
  v.process
end
