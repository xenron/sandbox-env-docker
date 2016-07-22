require 'time'

now = Time.now.to_i
yesterday = now - 24*60*60

yesterday.upto now do |time|
  used = 100e6 * Math.sin(time) + 300e6
  puts "dockerhost.memory.memory-used #{used} #{time}"
  puts "dockerhost.memory.memory-free #{500e6 - used} #{time}"
end
