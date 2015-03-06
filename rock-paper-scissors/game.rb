# Rock Paper Scissors Game - Meredith Fuhrman

#global variable track of winning
$player_win = 0
$computer_win = 0

#methods
def get_player_choice
  puts "Player Score: #{$player_win} Computer Score: #{$computer_win}"
  print "Choose rock (r), paper (p), or scissor(s): "
  input = gets.chomp.downcase

  if (input != 'r') && (input != 'p') && (input != 's')
    puts "Invalid entry, try again."
    puts
  else
    return input
  end
end

def get_computer_choice
  computer = rand(3)
  return 'r' if computer == 0
  return 'p' if computer == 1
  return 's' if computer == 2
end

def state_choice(player_choice, computer_choice)
  puts "Player chose #{player_choice}"
  puts "Computer chose #{computer_choice}"
end

def determine_winner(player_choice, computer_choice)
  if player_choice == 'r'
    if computer_choice == 'p'
      puts "Paper beats rock, computer wins."
      return $computer_win += 1

    elsif computer_choice == 's'
      puts "Rock beats scissor, player wins."
      return $player_win += 1
    end

  elsif player_choice == 'p'
    if computer_choice == 'r'
      puts "Paper beats rock, player wins."
      return $player_win += 1

    elsif computer_choice == 's'
      puts "Scissor beats paper, computer wins."
      return $computer_win += 1
    end

  elsif player_choice == 's'
    if computer_choice == 'p'
      puts "Scissor beats paper, player wins."
      return $player_win += 1

    elsif computer_choice == 'r'
      puts "Rock beats scissor, computer wins."
      return $computer_win += 1
    end
  end

  puts "Tie, chose again"

end

def announce_winner
  if $computer_win > $player_win
    puts "Computer wins!"
  else
    puts "Player wins!"
  end
end


#play the game!
while ($player_win < 2) && ($computer_win < 2)
  player_choice = get_player_choice
  computer_choice = get_computer_choice
  state_choice(player_choice, computer_choice)
  determine_winner(player_choice, computer_choice)
  puts
end

announce_winner
