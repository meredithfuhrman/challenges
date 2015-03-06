# YOUR CODE HERE
(1..100).each {| num | puts num unless num % 2 == 0 }

#can also do

(1..100).select {| num | puts num if num.odd? }
