require "pg"
require "csv"
require "pry"
require "date"
require "set"

system "psql korning < schema.sql"

#Database connection helper method
def db_connection
  begin
    connection = PG.connect(dbname: "korning")
    yield(connection)
  ensure
    connection.close
  end
end

#Methods to parse and insert de-duped employee data into employees table
def parse_employee(employee)
    email = employee.gsub(/\([^()]*?\)/).to_a)[0].gsub!(/[()]/, ""
    name = employee.gsub(/\(.*\)/, "").rstrip!
    {name: name, email: email}
end

def insert_employee(employee)
  db_connection do |conn|
      result = conn.exec("SELECT id FROM employees WHERE name = $1", [employee[:name]])
      if result.to_a.empty?
        sql = "INSERT INTO employees (employee, email) VALUES ($1, $2) RETURNING id"
        result = conn.exec(sql, [employee[:name], employee[:email]])
      end
      result.first["id"]
  end
end

#Methods to parse and insert de-duped customer data into customers table
def parse_customer(customer)

  account_no = customer.gsub(/\([^()]*?\)/).to_a)[0].gsub!(/[()]/, ""
  customer = customer.gsub(/\(.*\)/, "").rstrip!

  {account_no: account_no, customer: customer}
end

def insert_customer(blue)
  db_connection do |conn|
      result = conn.exec("SELECT id FROM customers WHERE customer = $1", [blue[:customer]])
      if result.to_a.empty?
        sql = "INSERT INTO customers (customer, account_no) VALUES ($1, $2) RETURNING id"
        result = conn.exec(sql, [blue[:customer], blue[:account_no]])
      end
      result.first["id"]
  end
end

#Method to insert de-duped product data into products table
def insert_product(blue)
  db_connection do |conn|
      result = conn.exec("SELECT id FROM products WHERE product = $1", [blue])
      if result.to_a.empty?
        sql = "INSERT INTO products (products) VALUES ($1) RETURNING id"
        result = conn.exec(sql, [blue[:product]])
      end
      result.first["id"]
  end
end

#Method to insert de-duped invoice_frequency data into invoice_frequencies table
def insert_invoice_frequency(blue)
  db_connection do |conn|
      result = conn.exec("SELECT id FROM invoice_frequencies WHERE frequency = $1", [blue])
      if result.to_a.empty?
        sql = "INSERT INTO products (products) VALUES ($1) RETURNING id"
        result = conn.exec(sql, [blue])
      end
      result.first["id"]
  end
end

#Method to insert de-duped sales_date data into sales_dates table
def insert_sales_date(blue)
  db_connection do |conn|
      result = conn.exec("SELECT id FROM sales_dates WHERE sales-date = $1", [blue])
      if result.to_a.empty?
        sql = "INSERT INTO sales_dates (sales_date) VALUES ($1) RETURNING id"
        result = conn.exec(sql, [blue])
      end
      result.first["id"]
  end
end

#Method to insert all data into invoices table
def insert_invoices(transaction, foreign_keys)
  arguments = [
  transaction[:invoice_no]
  transaction[:sale_amount],
  transaction[:units_sold],
  foreign_keys[:customer_id]
  foreign_keys[:invoice_frequency],
  foreign_keys[:sale_date]
  foreign_keys[:employee_id],
  foreign_keys[:product_id],
]

  db_connection do |conn|
    sql = <<-eos
    INSERT INTO invoices (invoice_no, sale_amount, units_sold, customer_id, invoice_frequency_id,
    sales_date, employee_id, product_id)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
    eos
    conn.exec_params(sql, arguments)
  end
end


#Seeding database with normalized data
print "Loading."

CSV.foreach("sales.csv", headers: true, header_converters: :symbol ) do |row|
  print '.'
  transaction = row.to_hash

  #inserts normalized employee data
  employee = parse_employee(transaction[:employee])
  employee_id = insert_employee(employee)


  # Insert normalized customer data
  customer = parse_customer(transaction[:customer_and_account_no])
  customer_id = insert_customer(customer)

  #Insert normalized product data
  product = { name: transaction[:product_name] }
  product_id = insert_product(product)

  #Insert normalized invoice frequency data
  invoice_frequency = { name: transaction[:invoice_frequency] }
  invoice_frequency_id = insert_invoice_frequency(invoice_frequency)

  #Insert normalized sales date  data
  sales_date = { name: transaction[:sales_date] }
  sales_date_id = insert_sales_date(sales_date)

  #Insert normalized invoice data
  foreign_keys = { employee_id: employee_id, product_id: product_id, customer_id: customer_id }
  insert_invoice(transaction, foreign_keys)
end

puts "Import complete.  You now have a normalized database!"
