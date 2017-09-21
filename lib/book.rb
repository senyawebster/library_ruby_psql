class Book
  attr_reader(:id, :title, :author_id)

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @title = attributes.fetch(:title)
    @author_id = attributes.fetch(:author_id)
  end

  def self.all
    returned_books = DB.exec('SELECT * FROM author_title;')
    books = []
    returned_books.each() do |book|
      id = book.fetch('id').to_i
      title = author.fetch('title')
      author_id = book.fetch('author_id')
      books.push(Book.new({:id => id, :title => title, :author_id => author_id}))
    end
    books
  end

  def save
    result = DB.exec("INSERT INTO author_title (id, title, author_id) VALUES (#{@id}, #{@title}, #{@author_id}) RETURNING id;")
    @id = result.first().fetch('id').to_i
  end


end
