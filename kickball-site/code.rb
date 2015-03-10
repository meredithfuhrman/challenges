require "sinatra"
require "json"
require "pry"

file = File.read('roster.json')
team_hash = JSON.parse(file)


#To show teams page; testing having formatting loop on .erb file
get "/:team" do
  team_name = params[:team]
  positions = team_hash[team_name]

  erb :teamsite, locals: {positions: positions, team_name: team_name}
end

#To show optional positions page; testing having formatting loop in GET request
get "/position/:position" do
  desired_position = params[:position]
  player_list = []
  team_hash.each do |team_name, players|
    player_list << "#{players[desired_position]}: #{team_name}"
  end

  erb :positionsite, locals: {desired_position: desired_position,
    player_list: player_list}
end
