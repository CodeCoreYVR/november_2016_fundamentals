print 'What year is car made in?'

year = gets.to_i

if year >= 2017
  puts 'Future car'
elsif year >= 2014
  puts 'New car'
elsif year >= 2000
  puts 'Old Car'
else
  puts 'Very old car'
end
