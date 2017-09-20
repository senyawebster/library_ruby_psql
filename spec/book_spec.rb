require('spec_helper')

describe(Book) do

  describe(".all") do
    it("is empty at first") do
      expect(Book.all()).to(eq([]))
    end
  end

  describe("#book_title") do
    it("tells you the book's title") do
      book = Book.new(:book_title => 'Bible', :author_name => 'God', :book_id => 1)
      expect(book.book_title()).to(eq('Bible'))
    end
  end

  describe("#author_name") do
    it("tells you author_name") do
      author = Book.new(:book_title => 'Bible', :author_name => 'God', :book_id => 1)
      expect(author.author_name()).to(eq("God"))
    end
  end

  describe("#book_author") do
    it('tells you the id of the book') do
      id = Book.new(:book_title => 'Bible', :author_name => 'God', :book_id => 1)
      expect(id.book_id()).to(eq(1))
    end
  end

  describe('#save') do
    it('will add a book to the database') do
      new_book = Book.new(:book_title => 'Bible', :author_name => 'God', :book_id => nil)
      new_book.save
      expect(Book.all()).to(eq([new_book]))
    end
  end

end
