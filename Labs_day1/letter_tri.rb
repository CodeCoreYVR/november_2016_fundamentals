# counter = 1
# ('a'..'z').each do |letter|
# 	puts letter * counter
# 	counter += 1
# end

('a'...'z').each_with_index do
	puts letter * (index + 1)
end  #{|letter, index| puts letter * (index + 1)}
