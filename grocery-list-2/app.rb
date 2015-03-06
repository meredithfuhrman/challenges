require "sinatra"
require "pg"


def db_connection
  begin
    connection = PG.connect(dbname: "grocery_list")
    yield(connection)
  ensure
    connection.close
  end
end

#to get all items from list
get "/groceries" do
  get_list = db_connection { |conn| conn.exec("SELECT item FROM groceries") }
  grocery_list = get_list.to_a
  erb :list, locals: { grocery_list: grocery_list }
end

#To post new items to list
post "/groceries" do
  db_connection do |conn|
    conn.exec_params("INSERT INTO groceries (item) VALUES ($1)", [params[:item]]);
  end
  redirect "/groceries"
end
