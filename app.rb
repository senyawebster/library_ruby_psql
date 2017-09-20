require('sinatra')
require('sinatra/reloader')
require('./lib/book')
require('./lib/patron')
also_reload('lib/**/*.rb')
require("pg")
require('pry')

DB = PG.connect({:dbname => 'library_test'})

get('/') do
  erb(:index)
end

get('/librarian') do
  erb(:librarian)
end

post('/librarian') do
  erb(:librarian)
end
