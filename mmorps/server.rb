require "sinatra"
require "sinatra/flash"
require "rack"

use Rack::Session::Cookie, {
  secret: "keep_it_secret_keep_it_safe",
}


def get_computer_choice
  computer = rand(3)
  return "Rock" if computer == 0
  return "Paper" if computer == 1
  return "Scissor" if computer == 2
end

def compare(player, computer)
  result =
    if player == computer
      "Tie, no winner for"
    elsif (player == "Rock" && computer == "Scissor") ||
      (player == "Paper" && computer == "Rock") ||
      (player == "Scissor" && computer == "Paper")
      "Player wins"
    else
      "Computer wins"
    end
    result
end

def score(key)
  if session[key].nil?
    0
  else
    session[key].to_i
  end
end


get "/" do
  erb :game, locals: { player_score: score(:player_score), computer_score: score(:computer_score),
    winner: session[:winner]
     }
end

post "/reset" do
  session.clear
  redirect "/"
end

post "/choose" do

  computer_choice = get_computer_choice
  round_result = compare(params[:choice], computer_choice)

  if round_result == "Player wins"
    session[:player_score] = score(:player_score) + 1
  elsif round_result == "Computer wins"
    session[:computer_score] = score(:computer_score) + 1
  end

  flash[:round_result] = round_result
  flash[:computer_choice] = computer_choice
  flash[:player_choice] = params[:choice]

  if score(:player_score) >= 2
    session[:winner] = "Player"
  elsif score(:computer_score) >= 2
    session[:winner] = "Computer"
  end

  redirect "/"
end
