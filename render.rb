require_relative 'book/book_ui'
require_relative './modules/check_files_existence'

class Render
  include Files
  def initialize
    check_files_existence
    @book_ui = BookUI.new
  end
  def actions
    options = [
      '1 - List all books',
      '2 - List all music albums',
      '3 - List all games',
      "4 - List all genres(e.g 'Comedy', 'Thriller')",
      "5 - List all labels(e.g 'Gift', 'New')",
      "6 - List all authors(e.g 'Stephen King')",
      '7 - Add a book',
      '8 - Add a music album',
      '9 - Add a game',
      '10 - Exit'
    ]
    puts options
  end

  def get_request(message, input_type = :to_s)
    print message
    input = gets.chomp
    input_type == :to_i ? input.to_i : input
  end

    def execute_action(choice)
    case choice
    when 1
      @book_ui.list_books
    when 5
      @book_ui.list_labels
    when 7
      @book_ui.add_book
    when 10
      puts "Exiting..."
      exit
    else
      puts "Invalid choice!"
    end
  end

end
