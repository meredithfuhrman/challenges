require "sinatra"
require "json"

file = File.read('roster.json')
team_hash = JSON.parse(file)


get "/:team" do
  team_name = params[:team]
  positions = team_hash[team_name]
  erb :teamsite, locals: {positions: positions, team_name: params[:team]}
end
