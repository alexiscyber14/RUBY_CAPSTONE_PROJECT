class Render
  def actions
    options = [
      '1 - List all books',
      '2 - List all music albums',
      '3 - List all games',
      '4 - List all genres',
      "5 - List all labels(e.g 'Comedy', 'Thriller')",
      "6 - List all labels(e.g 'Gift', 'New')",
      "7 - List all authors(e.g 'Stephen King')",
      '8 - Add a book',
      '9 - Add a music album',
      '10 - Add a game',
      '11 - Exit'
    ]
    puts options
  end

  def get_request(message, input_type = :to_s)
    print message
    input = gets.chomp
    input_type == :to_i ? input.to_i : input
  end

  def execute_action(choice)
  end
end
