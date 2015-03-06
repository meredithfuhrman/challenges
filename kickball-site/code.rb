require "sinatra"
require "json"
require "pry"

file = File.read('roster.json')
team_hash = JSON.parse(file)


get "/:position" do
  desired_position = params[:position]

  player_list = {}

  team_hash.each do |team, roster|
    roster.select {|position, player| player_list.push(player) if position == desired_position}
  end

  erb :positionsite, locals: {player_list: player_list, desired_position: params[:position]}
end





  # team_hash.each do |team, roster|
  #   roster.select do |position, player|
  #     if position == desired_position
  #       player_list[team] = player
  #     end
  #   end
  # end
