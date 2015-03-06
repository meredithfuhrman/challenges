# YOUR CODE HERE

(1..100).each do | num |
  x=''
  x+= "Fizz" if num % 3 == 0
  x+= "Buzz" if num % 5 == 0
  puts(x.empty? ? num : x);
end
