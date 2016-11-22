require_relative 'catalogues'
require_relative 'reader'
require_relative 'order'

class Library < Catalogues
  attr_accessor  :orders, :readers

  def initialize
    @orders, @readers = [], []
    super
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

  def most_intensive_reader
    @orders.group_by{|order| order.reader.name}.max_by{|_,orders| orders.count}
  end

  def most_popular_books(count)
    @orders.group_by{|order| order.book.title}.max_by(count){|_,orders| orders.count}
  end

  def how_many_people_read_the_most_popular_books(count)
    most_popular_books(count).transpose.last.flatten.group_by{|order| order.reader.name}.count
  end

  def one_popular_book
    most_popular_books(1).first
  end

  def no_popular_book
    @orders.group_by{|order| order.book.title}.min_by{|_,orders| orders.count}
  end

end