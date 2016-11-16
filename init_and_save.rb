require './classes/library.rb'

library = Library.new

library.add_book('Mark Twain','The Adventures of Huckleberry Finn')
library.add_book('Mark Twain','The Adventures of Tom Sawyer')
library.add_book('Ray Bradbury','Fahrenheit 451')
library.add_book('Ernest Hemingway','The Old Man and the Sea')
library.add_book('Ernest Hemingway','The Sun Also Rises')
library.add_book('L. Frank Baum','The Wonderful Wizard of Oz')
library.add_book('James Fenimore Cooper','The Last of the Mohicans')

library.new_reader('Andrey', email:'andrey@in.ua')
library.new_reader('Bob', email:'bob@in.ua', city:'Kiev')
library.new_reader('Jane', email:'jane@in.ua', city:'Dnepr', street:'12-th line', house:12)

library.new_order('The Old Man and the Sea', 'Bob')
library.new_order('The Sun Also Rises', 'Jane')
library.new_order('The Old Man and the Sea', 'Jane')
library.new_order('The Adventures of Tom Sawyer', 'Andrey')
library.new_order('Fahrenheit 451', 'Bob')
library.new_order('The Sun Also Rises', 'Andrey')
library.new_order('The Wonderful Wizard of Oz', 'Jane')
library.new_order('The Last of the Mohicans', 'Andrey')
library.new_order('The Last of the Mohicans', 'Jane')
library.new_order('The Sun Also Rises', 'Bob')

library.new_order('The Old Man and the Sea', 'No_Reader')
library.new_order('No Book', 'Bob')

puts "books count = #{library.books.count}"
puts "author count = #{library.authors.count}"
puts "readers count = #{library.readers.count}"
puts "orders count = #{library.orders.count}"

library.save('books')
library.save('orders')
library.save('readers')
library.save('authors')