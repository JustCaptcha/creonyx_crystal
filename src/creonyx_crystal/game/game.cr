# Main game module
# Game loop exist here
# TODO: 1
#       2
#       3

require "./intro"
require "./menu"
require "./world"
require "../engine"
require "../state/state_manager.cr"


module Game
  class Game
    getter state = State::StateManager.new
    getter window : SF::RenderWindow
    getter game_over : Bool = false
    getter running : Bool = false

    def initialize()
      @game_over = false
      # @state = State::StateManager.new()
      @window = state.global.window
      @engine = Engine::Engine.new()
    end

    def run()
      @engine.run()
      intro()
      main_menu()
      game()
      game_end()
      @engine.close()
    end

    def intro()
      intro = Intro::Intro.new(window)
      intro.show()
    end

    def main_menu()
      main_menu = Menu::MainMenu.new(window)
      main_menu.show()
      # Comment here
    end

    # Game methods section
    def game()
      # TODO:
      # game initialize
      world_start()
      while window.open?
        # render
        # logic
        window_update()
        game_loop()
        check_events()
      end
      puts "Game end"
    end

    def window_update()
      window.clear(SF::Color::Red)
      window.display()
    end

    def check_events(*events)
      while event = window.poll_event
        # "close requested" event: we close the window
        if event.is_a? SF::Event::Closed
          window.close
        end

        if event.is_a? SF::Event::KeyPressed
          if event.code = SF::Keyboard::Escape
            puts "Escape"
            window.close
          end
        end

      end
    end

    def world_start()
      world = World::World.new()
      # world.generate()
    end

    def game_loop()
      # Game loop here
      sleep 1.seconds

      # @engine.update()
    end

    def game_end()
      puts "Bye"
    end
  end
end
