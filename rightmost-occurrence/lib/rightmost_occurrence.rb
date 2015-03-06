def rightmost(string, character)
  (string.length-1).downto(0) {|i|
    return i if string[i].downcase == character.downcase }
  #if no matching character found
  nil
end

puts rightmost("big bad bikers", "b")
puts rightmost('abc', 'x')
puts rightmost('t', 't')
puts rightmost('cat dog', 'd')
puts rightmost('cat dog tutu', 't')
puts rightmost('Sometimes I like yOu', 'o')

#Note to self: can also use (0..(string.length-1)).reverse_each instead of downto
