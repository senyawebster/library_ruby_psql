class Author
  attr_reader(:id, :author)

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @author = attributes.fetch(:author)
  end

  def self.all
  returned_authors = DB.exec("SELECT * FROM authors;")
  authors = []
  returned_authors.each() do |author|
    id = author.fetch('id').to_i
    author = author.fetch('author')
    authors.push(Author.new({:id => id, :author => author}))
  end
  authors
end

def save
  result = DB.exec("INSERT INTO authors (author) VALUES ('#{@author}') RETURNING id;")
  @id = result.first().fetch('id').to_i()
end

end
