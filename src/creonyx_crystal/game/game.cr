require "./menu"
require "../engine"
require "../state/global"

module Game
  class Game
    getter global_state = State::Global.new
    getter window : SF::RenderWindow = global_state.window
    getter game_over : Bool = false
    getter running : Bool = false

    def initialize()
      # @global_state = State::Global.new
      # @game_over = false
      @engine = Engine::Engine.new()
    end

    def run()
      intro()
      main_menu()
      game()
      game_end()
    end

    def intro()
      window.clear(SF::Color::Black)
      window.display()
      puts "Intro section"
      sleep 3.seconds
    end

    def main_menu()
      main_menu = Menu::MainMenu.new(window)
      main_menu.show()
      # Comment here
    end

    def game()
      while window.open?
        window.clear(SF::Color::Red)
        window.display()
        # Start game engine
        # engine.new
        game_loop()



        while event = window.poll_event
          # "close requested" event: we close the window
          if event.is_a? SF::Event::Closed
            window.close
          end
        end
      end
      puts "Game end"
    end

    def game_loop()
      # Game loop here
      puts "game loop"
      sleep 1.seconds
      while global_state.game_over != true
        puts "test"
        global_state.end_game()
      end
      # @engine.update()
    end

    def game_end()
      puts "Bye"
    end
  end
end
