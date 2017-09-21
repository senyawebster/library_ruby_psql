class Book
  attr_reader(:id, :title_id, :author_id)

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @title_id = attributes.fetch(:title_id)
    @author_id = attributes.fetch(:author_id)
  end

  def self.all
    returned_books = DB.exec('SELECT * FROM author_title;')
    books = []
    returned_books.each() do |book|
      id = book.fetch('id').to_i
      title_id = author.fetch('title_id')
      author_id = book.fetch('author_id')
      books.push(Book.new({:id => id, :title_id => title_id, :author_id => author_id}))
    end
    books
  end

  def save
    result = DB.exec("INSERT INTO author_title (id, title_id, author_id) VALUES (#{@id}, #{@title_id}, #{@author_id}) RETURNING id;")
    @id = result.first().fetch('id').to_i
  end


end
