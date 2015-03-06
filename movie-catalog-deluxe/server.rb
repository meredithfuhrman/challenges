require 'sinatra'
require 'pg'
require 'pry'


def db_connection
  begin
    connection = PG.connect(dbname: "movies")
    yield(connection)
  ensure
    connection.close
  end
end


get '/actors' do
  sql_statement = <<-eos
  SELECT actors.name, COUNT (movies.title) AS movie_count
    FROM cast_members
    FULL OUTER JOIN actors ON cast_members.actor_id = actors.id
    FULL OUTER JOIN movies ON cast_members.movie_id = movies.id
    GROUP BY actors.name;
    eos

  actors = db_connection { |conn| conn.exec(sql_statement)}
  all_actors = actors.to_a

  erb :'actors/index', locals: {actors: all_actors}
end

get '/actors/:id' do
  sql_statement = <<-eos
  SELECT movies.title, movies.id AS movie_id, cast_members.character FROM cast_members
    FULL OUTER JOIN actors ON cast_members.actor_id = actors.id
    FULL OUTER JOIN movies ON cast_members.movie_id = movies.id
    WHERE actors.name = $1
    ORDER BY movies.title;
  eos
  actors = db_connection { |conn| conn.exec(sql_statement,[params[:id]])}
  actor_details = actors.to_a

  erb :'actors/details', locals: {actor_details: actor_details}
end

get '/movies' do
  sql_statement = <<-eos
  SELECT movies.title, movies.id, movies.year, movies.rating, movies.id,
    genres.name AS genre, studios.name AS studio
  FROM movies
  FULL OUTER JOIN genres ON movies.genre_id = genres.id
  FULL OUTER JOIN studios ON movies.studio_id = studios.id
  ORDER BY movies.title;
  eos

  movies = db_connection { |conn| conn.exec(sql_statement)}
  all_movies = movies.to_a

  erb :'movies/index', locals: {movies: all_movies}
end

get '/movies/:id' do
  sql_movie = <<-eos
  SELECT movies.title, movies.year, movies.rating,
    genres.name AS genre, studios.name AS studio
  FROM movies
  FULL OUTER JOIN genres ON movies.genre_id = genres.id
  FULL OUTER JOIN studios ON movies.studio_id = studios.id
  WHERE movies.id = $1;
  eos

  sql_cast = <<-eos
  SELECT cast_members.character, actors.name AS actor
  FROM cast_members
  FULL OUTER JOIN movies ON movies.id = cast_members.movie_id
  FULL OUTER JOIN actors ON actors.id = cast_members.actor_id
  WHERE movies.id = $1
  ORDER BY cast_members.character;
  eos

  movie_details = []
  movie_cast = []

  db_connection do |conn|
    movie_details = (conn.exec(sql_movie, [params[:id]])).to_a
    movie_cast  = (conn.exec(sql_cast, [params[:id]])).to_a
  end

  erb :'movies/details', locals: {details: movie_details, cast: movie_cast}
end

post '/actor_search' do

  sql_search = <<-eos
  SELECT cast_members.character, actors.name AS actor
  FROM cast_members
  FULL OUTER JOIN actors ON actors.id = cast_members.actor_id
  WHERE actor.name ILIKE $1 OR cast_members.character ILIKE $1
  eos

  db_connection do |conn|
    search = (conn.exec(sql_search, [params[:query]])).to_a
  end

end
