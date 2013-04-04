# gem install --version 1.3.0 sinatra

#Add a layout that yields to a template (DONE)
#Add a /products route that lists all the products in the store database in an HTML table (DONE)
#Add a root route (/) that contains links to the /users and /products pages (DONE)
#Add a back button on /users and /products that takes you back to the home page (DONE)
#Style the tables using CSS (DONE)
#If the product is on sale, display an image in the table (DONE)
#Add "zebra stripes" to the table (rows alternate background colors, making them easier to read across) (DONE)
#Submit the assignment by commiting and pushing a repository to GitHub (no need to submit to Schoology).

require 'pry'
gem 'sinatra', '1.3.0'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
 
 
get '/users' do
  db = SQLite3::Database.new "store.sqlite3"
  db.results_as_hash = true
  @rs = db.prepare('SELECT * FROM users;').execute
  erb :show_users
end


get '/products' do
  db = SQLite3::Database.new "store.sqlite3"
  db.results_as_hash = true
  @rs = db.prepare('SELECT id, name, price, on_sale FROM products;').execute
  erb :show_products
end
 
 
get '/' do
  erb :home
end
 
 
 
 
 
 
 
 
 
=begin
 
  <form method='post' action='/create'>
    <input type='text' name='name' autofocus>
    <input type='text' name='photo'>
    <input type='text' name='breed'>
    <button>dog me!</button>
  </form>
 
 
  post '/create' do
  end
 
 
  redirect '/'
 
=end