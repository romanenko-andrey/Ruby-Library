require_relative 'file_lib'
require_relative 'reader'
require_relative 'order'
require_relative 'book'
require_relative 'author'

class Library
  include FileLib

  attr_accessor  :orders, :readers, :books, :authors

  def initialize
    @orders, @readers, @books,  @authors = [], [], [], []
  end

  def new_reader(name, details)
    return if @readers.find{|abonent| abonent.name == name}
    @readers << Reader.new(name, details)
  end

  def new_order(book_title, reader_name)
    the_book = @books.find{|book| book.title == book_title}
    raise "The book \"#{book_title}\" is not exists in the library!"  unless the_book
    the_reader = @readers.find{|reader| reader.name == reader_name}
    raise "The reader \"#{reader_name}\" does not registred in the library!" unless the_reader
  rescue => error
    puts 'Error in the order! ' + error.message
  else
    @orders << Order.new(the_book, the_reader)
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
    id = @authors.find_index {|present_author| present_author.name == @new_author}
    if id
      @authors[id].biography << @new_book
    else
      @authors << Author.new(@new_author, [@new_book])
    end
  end

  def most_intensive_reader
    @orders.group_by{|order| order.reader.name}.max_by{|_,orders| orders.count}
  end

  def most_popular_books(count = 1)
    @orders.group_by{|order| order.book.title}.max_by(count){|_,orders| orders.count}
  end

  def how_many_people_read_the_most_popular_books(count)
    most_popular_books(count).map(&:last).flatten.group_by{|order| order.reader.name}.count
  end

  def one_popular_book
    most_popular_books.first
  end

  def no_popular_book
    @orders.group_by{|order| order.book.title}.min_by{|_,orders| orders.count}
  end
end