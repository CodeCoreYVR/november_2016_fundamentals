# x = 1
#
# loop do
# 	if x % 3 == 0 && x % 5 == 0
# 		puts x.to_s + ': '
# 		p 'FIZZBUZZ'
# 	elsif x % 3 == 0
# 		puts x.to_s + ': '
# 		p 'FIZZ'
# 	elsif x % 5 == 0
# 		puts x.to_s + ': '
# 		p 'BUZZ'
# 	else
# 		puts x
# 	end
# 	x += 1
# 	break if x >= 100
# end

puts (1..100).each {|n| p n % 15 == 0 ? "FizzBuzz" : n % 5 ==0 ? "Buzz" : n % 3 == 0 ? "Fizz" : n}
