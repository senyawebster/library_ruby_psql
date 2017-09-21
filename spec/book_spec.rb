require('spec_helper')

describe(Book) do

  describe(".all") do
    it("is empty at first") do
      expect(Book.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("returns a primary key for a book w/ author & title") do
      book = Book.new(:id => 1, :title => 2, :author_id => 3)
      expect(book.id()).to(eq(1))
    end
  end

  describe("#title") do
    it("returns the title of a book") do
      book = Book.new(:id => 1, :title => 2, :author_id => 3)
      expect(book.title()).to(eq(2))
    end
  end

  describe("#author_id") do
    it('tells you the id of the author') do
      book = Book.new(:id => 1, :title => 2, :author_id => 3)
      expect(book.author_id()).to(eq(3))
    end
  end

  describe('#save') do
    it('will save a book to the database') do
      book = Book.new(:id => 1, :title => 1, :author_id => 1)
      book.save()
      expect(Book.all()).to(eq([book]))
    end
  end

end
