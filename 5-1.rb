require 'digest/md5'

$input = 'reyedfim'
$num = 0
$output = ''

while true do
  val = "#{$input}#{$num}"
  test = Digest::MD5.hexdigest(val)
  $output += test[5] if test.start_with?('00000')
  break if $output.length == 8
  $num += 1
end

puts $output
