require 'digest/md5'

$input = 'reyedfim'
$num = 0
$output = '________'

while true do
  val = "#{$input}#{$num}"
  test = Digest::MD5.hexdigest(val)
  if test.start_with?('00000')
    position = test[5]
    if position =~ /[0-7]/
      puts test
      position = position.to_i
      value = test[6]
      if $output[position] == '_'
        $output[position] = value
        puts $output
      end
    end
  end
  break unless $output.include?('_')
  $num += 1
end

puts $output
