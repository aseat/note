input_line = gets.to_i
input_line.times do
  s = gets.chomp.split(" ")
  print "hello = #{ s[0] } , world = #{ s[1] }\n"
end