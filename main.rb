require_relative 'render'

class Main
  def initialize
    @render = Render.new
  end

  puts 'Welcome, choose any option below'
  def main
    loop do
      list = @render.actions
      choice = @render.get_request('Enter your choice: ', :to_i)
      
      case choice
      when 1..10
        @render.execute_action(choice)
      when 11
        break
      else
        puts 'Please enter a valid option'
      end
    end
  end
end

main_app = Main.new
main_app.main
