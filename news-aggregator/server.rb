require "sinatra"
require "csv"
require "pry"

get "/articles/new" do
  erb :article_form
end

post "/articles/new" do

  CSV.open("articles.csv", "a") do |csv|
    csv << [params[:title], params[:url], params[:description]]
  end

  redirect "/articles"
end


get "/articles" do
  articles = []
  CSV.foreach("articles.csv", headers: true) {|row| articles << row}


  erb :article_page, locals: {articles: articles}
end
