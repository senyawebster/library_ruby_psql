require('spec_helper')

describe(Author) do

  describe(".all") do
    it("is empty at first") do
      expect(Author.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("returns a primary key for an author") do
      book_author = Author.new(:id => 1, :author => 'Frank Herbert')
      expect(book_author.id()).to(eq(1))
    end
  end

  describe("#author") do
    it("returns the author of a book") do
      book_author = Author.new(:id => 1, :author => 'Frank Herbert')
      expect(book_author.author()).to(eq('Frank Herbert'))
    end
  end

  describe('#save') do
    it('will save a book to the database') do
      author = Author.new(:id => 1, :author => 'Frank Herbert')
      author.save()
      expect(Author.all()).to(eq([author]))
    end
  end

end
