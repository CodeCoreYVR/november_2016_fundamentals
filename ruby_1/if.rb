print 'Give me a number: '
number = gets.to_i

# when the expression given to the `if` statement is true then the piece of
# code within the `if` will get executed
if number >= 100
  puts 'The number is large'
elsif number >= 50
  puts 'The number is medium'
elsif number >= 25
  puts 'The number is small'
else
  puts 'The number is very small'
end

# to construct a conditional you must have a if clause
# you can optionally have multiple `elsif` blocks
# you can optionally have only a single `else`
# `else` does not take a statement at all
# It's highly recommended that you indent code within each of the clauses above
