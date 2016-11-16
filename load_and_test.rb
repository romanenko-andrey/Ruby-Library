require './classes/library.rb'

NAME, ORDERS = 0, 1

library = Library.new

library.load('books')
library.load('orders')
library.load('readers')
library.load('authors')

puts 'Read books count = ' + library.books.count.to_s
puts 'Read author count = ' + library.authors.count.to_s
puts 'Read readers count = ' + library.readers.count.to_s
puts 'Read orders count = ' + library.orders.count.to_s

the_best_reader = library.most_intensive_reader
puts "The most intensive reader is #{the_best_reader[NAME]}. He read #{the_best_reader[ORDERS].count} book!"

the_best_book = library.one_popular_book
puts "The most popular book is #{the_best_book[NAME]}. It was read #{the_best_book[ORDERS].count} times!"

no_popular_book = library.no_popular_book
puts "The not popular book is #{no_popular_book[NAME]}. It was read #{no_popular_book[ORDERS].count} times!"

tree_best_books = library.most_popular_books(3)
puts 'Three popular books is: '
the_best_books_orders_count = tree_best_books.inject(0) do |sum, book|
  puts '    ' + book[NAME]
  sum += book[ORDERS].count
end

puts "it was read #{the_best_books_orders_count} times by " +
  "#{library.how_many_people_read_the_most_popular_books(3)} readers"

