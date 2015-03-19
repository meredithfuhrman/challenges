require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'omniauth-github'

require_relative 'config/application'

Dir['app/**/*.rb'].each { |file| require_relative file }

helpers do
  def current_user
    user_id = session[:user_id]
    @current_user ||= User.find(user_id) if user_id.present?
  end

  def signed_in?
    current_user.present?
  end
end

def set_current_user(user)
  session[:user_id] = user.id
end

def authenticate!
  unless signed_in?
    flash[:notice] = 'You need to sign in if you want to do that!'
    redirect '/'
  end
end

get '/' do
  erb :index

end

get '/auth/github/callback' do
  auth = env['omniauth.auth']

  user = User.find_or_create_from_omniauth(auth)
  set_current_user(user)
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/meetups'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/example_protected_page' do
  authenticate!
end

get '/meetups' do
  meetups = Meetup.select(:id, :name).order('name')

  erb :meetups, locals: {meetups: meetups}
end

get '/:meetup_id' do |id|
  meetup = Meetup.find_by(id: id)

  erb :id, locals: {meetup: meetup }
end

post '/new' do
  name = params[:meetup_name]
  description = params[:meetup_description]
  location = params[:meetup_location]

  Meetup.create!(name: name, description: description, location: location)

  flash[:notice] = "You've successfully created the meetup #{Meetup.find_by(name: name).name}!"
  redirect '/meetups'
end

post '/join' do
  meetup = params[:meetup_id]
  user = session[:user_id]

  Member.create!(user_id: user, meetup_id: meetup)
  flash[:notice] = "You've now successfully joined #{Meetup.find_by(id: meetup).name}!"
  redirect "/#{meetup}"
end
