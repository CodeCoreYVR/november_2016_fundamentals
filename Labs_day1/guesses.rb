randnum = rand(100) + 1
guess = 0
loop do
	print 'Please guess the number between 1 and 100 inclusive: '
	usernum = gets.to_i
	guess += 1
	break if usernum == randnum
	if usernum > randnum
		puts 'Sorry, too high...'
	elsif usernum < randnum
		puts 'Sorry, too low...'
	end
end
puts "Hooray!  You guessed that the number was #{randnum}; it took you #{guess} attemopts."
