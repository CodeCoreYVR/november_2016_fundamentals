puts "What are your scores on the exam"
number = gets.to_i

if number >= 80
	puts "A"
elsif number >= 70
	puts "B"
elsif number >= 60
	puts "C"
elsif number >= 50
	puts "D"
else
	puts "F"
end
