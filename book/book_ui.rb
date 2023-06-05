require 'json'
require_relative 'book'
require_relative 'label'

class BookUI
  def initialize
    @books = []
    @labels = []
    read_from_file
  end

  def read_from_file
    @file_handler = FileHandler.new('book/books.json').read_file
    @parsed_data = @file_handler.empty? ? [] : JSON.parse(@file_handler)
    @books = @parsed_data
    labels = FileHandler.new('book/label.json').read_file
    @labels = labels.empty? ? [] : JSON.parse(labels)
  end

  def list_books
    puts "\n"
    puts "No available books at the moment..\n\n" if @books.empty?
    @books.each_with_index do |book, idx|
      print "#{idx + 1}. "
      book.each { |key, value| print "#{key}: #{value} " }
      puts "\n"
    end
    puts "\n"
    puts "\n"
  end

  def list_labels
    puts 'No available labels at the moment..' if @labels.empty?
    @labels.each_with_index do |label, idx|
      print "#{idx + 1}. "
      label.each { |key, value| print "#{key}: #{value} " }
      puts "\n"
    end
    puts "\n"
    puts "\n"
  end

  def create_book
    print 'Publisher Name: '
    @publisher = gets.chomp
    print 'Cover State: '
    @cover_state = gets.chomp
    print 'Publish Date: '
    @publish_date = gets.chomp
    puts "Book Label\n"
    print 'Title: '
    @label_title = gets.chomp
    print 'Color: '
    @label_color = gets.chomp
    @book = Book.new(@publish_date, @publisher, @cover_state)
    @label = Label.new(@label_title, @label_color)

    @label.add_item(@book)
    @new_label = { 'Book Publisher' => @book.publisher, 'Title' => @label.title, 'Color' => @label.color }
    @object = { 'Publish-date' => @book.publish_date, 'Publisher' => @book.publisher,
                'Cover-state' => @book.cover_state }

    @books << @object
    @labels << @new_label
    exit_app unless @book.nil?
  end

  def exit_app
    puts 'Book created successfully'
    @file_handler = FileHandler.new('book/books.json')
    @file_handler.write_to_file(@books) unless @books.empty?

    @file_handler = FileHandler.new('book/label.json')
    @file_handler.write_to_file(@labels) unless @labels.empty?
  end
end

class FileHandler
  def initialize(path)
    @path = path
  end

  def write_to_file(item)
    @item = item
    @generated_json = JSON.generate(@item)
    @file = File.open(@path, 'w')
    @file.write(@generated_json)
    @file.close
  end

  def read_file
    @file = File.read(@path)
    @file
  end
end
