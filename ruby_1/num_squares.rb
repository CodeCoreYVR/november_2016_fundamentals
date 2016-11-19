loop do
  puts 'Give me a number'
  number = gets.chomp
  break if number.downcase == 'exit'
  puts number.to_i * number.to_i
end
