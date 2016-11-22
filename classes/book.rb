class Book
  attr_reader :title, :author
  def initialize(author, title)
    @title, @author = title, author
  end
end