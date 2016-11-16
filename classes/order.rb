class Order
  attr_accessor :book, :reader, :date
  def initialize(book, reader)
    @book, @reader  = book, reader
    @date = Time.now
  end
end