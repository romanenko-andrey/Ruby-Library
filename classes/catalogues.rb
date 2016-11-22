class Catalogues
  BASE_PATH = "./base/library"
  attr_accessor :books, :authors

  class Author
    attr_accessor :name, :biography
    def initialize(name, biography = [])
      @name, @biography = name, biography
    end
  end

  class Book
    attr_reader :title, :author
    def initialize(author, title)
      @title, @author = title, author
    end
  end

  def initialize
    @books,  @authors = [], []
  end

  def add_book(author, book_title)
    @new_author, @new_book = author, book_title
    add_book_if_no_exist
    add_author_if_no_exist
  end

  def add_book_if_no_exist
    return if @books.find {|book| book.title == @new_book  && book.author == @new_author}
    @books << Book.new(@new_author, @new_book)
  end

  def add_author_if_no_exist
    exist = @authors.find_index {|present_author| present_author.name == @new_author}
    if exist
      @authors[exist].biography << @new_book
    else
      @authors << Author.new(@new_author, [@new_book])
    end
  end

  def load(source)
    File.open(BASE_PATH + '.' + source + '.dat') do |file|
      self.send(source + '=', Marshal.load(file) )
    end
  end

  def save(source)
    File.open(BASE_PATH + '.' + source + '.dat', 'w+') do |file|
      Marshal.dump(self.send(source), file)
    end
  end
end