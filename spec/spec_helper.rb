require('rspec')
require("pg")
require("book")
require("patron")

DB = PG.connect({:dbname => "library_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM book_author *;")
    DB.exec("DELETE FROM patrons *;")
  end
end
