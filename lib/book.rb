class Book
  attr_accessor(:book_title, :author_name, :book_id)

  def initialize(attributes)
    @book_title = attributes.fetch(:book_title)
    @author_name = attributes.fetch(:author_name)
    @book_id = attributes.fetch(:book_id)
  end

  def self.all
    returned_books = DB.exec('SELECT * FROM book;')
    books = []
    returned_books.each() do |book|
      book_title = book.fetch('book_title')
      author_name = author.fetch('author_name')
      book_id = book.fetch('book_id')
      books.push(Book.new({:book_title => book_title, :author_name => author_name, :book_id => id.to_i}))
    end
    books
  end

  def save
    result = DB.exec("INSERT INTO book (title_id, author_id) VALUES (#{@book_title}, #{@author_name}) RETURNING id;")
    @id = result.first().fetch('id').to_i
  end


end
