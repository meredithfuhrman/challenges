require "sinatra"
require "pg"
require "pry"

# To open connection
def db_connection
  begin
    connection = PG.connect(dbname: "news_aggregator_development")
    yield(connection)
  ensure
    connection.close
  end
end


get "/articles/new" do
  erb :article_form
end


post "/articles/new" do
  db_connection do |conn|
    conn.exec_params("INSERT INTO articles (title, url, description)
                      VALUES ($1, $2, $3)", [params[:title], params[:url], params[:descrip]]);
  end
  redirect "/articles"
end


#to display articles
get "/articles" do
  articles = db_connection { |conn| conn.exec("SELECT title, url, description FROM articles") }
  binding.pry
  all_articles = articles.to_a
  erb :article_page, locals: {all_articles: all_articles}
end
