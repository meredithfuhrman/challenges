#Meredith Fuhrman: Ninety Nine Bottles Refactored

num_now = 99

while num_now >= 1

  #method for plural vs singular
  def bottle num_now
    if num_now == 1
      bottle = 'bottle'
    else
      bottle = 'bottles'
    end
    return bottle
  end

  #method for lyric one, to force num now to update
  def lyric1 num_now
    "#{num_now} " + bottle(num_now) + " of beer on the wall, " +
    "#{num_now} " + bottle(num_now) + " of beer"
  end

  #rest of lyric templates
  lyric2 = "Take one down and pass it around,"
  endlyric1 = "No more bottles of beer on the wall, " +
  "no more bottles of beer."
  endlyric2 = "Go to the store and buy some more, " +
  "99 bottles of beer on the wall."

  #body lyrics, including changing punctuation for 10th num
  if (num_now % 10) == 0
    puts lyric1(num_now) + '!'
  else
    puts lyric1(num_now) + '.'
  end

  num_now = num_now - 1

  puts "#{lyric2} #{num_now} " + bottle(num_now) + " of beer on the wall."
  puts

end

#ends song
puts "#{endlyric1}"
puts "#{endlyric2}"
puts
