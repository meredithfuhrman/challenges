require "pg"
require "csv"

def db_connection
  begin
    connection = PG.connect(dbname: "ingredients")
    yield(connection)
  ensure
    connection.close
  end
end

def put_ingredients
  list = db_connection { |conn| conn.exec("SELECT number, ingredient FROM ingredients") }
  list.to_a.each {|row| puts "#{row['number']}. #{row['ingredient']}"}
end

all_ingredients = CSV.read("ingredients.csv")

db_connection do |conn|
  all_ingredients.each do |row|
    num = row[0]
    ingr = row[1]
    conn.exec_params("INSERT INTO ingredients (number, ingredient) VALUES ($1, $2)", [num, ingr])
  end
end

put_ingredients
