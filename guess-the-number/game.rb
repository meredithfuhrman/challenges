def generate_random
  rand(1..1000).to_i
end

def get_guess
  print "Guess a number between 1 and 1000: "
  gets.chomp.to_i
end

def play_game
  random = generate_random
  guess = get_guess

  until guess == random
    if guess < random
      puts "Too low, try again"
      guess = get_guess
    else
      puts "Too high, try again"
      guess = get_guess
    end
  end

  puts "Congratulations, you guessed the number!" if guess == random
end


play_game
