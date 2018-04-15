# include Global

module Menu
  class MainMenu
    getter window : SF::RenderWindow
    getter running : Bool = false
    @i = 0
    def initialize(window : SF::RenderWindow)
      @window = window
      @running = true
    end
    def show()
      while @running != false
        update()
        while event = window.poll_event
          check(event)
        end
      end
    end
    def update()
      window.clear(SF::Color::Blue)
      window.display()
    end
    def check(event)
      if event.is_a? SF::Event::Closed
        @running = false
        window.close
      end
      if event.is_a? SF::Event::KeyPressed
        if event.code == SF::Keyboard::Escape
          @running = false
        end
      end

      # @i += 1
      # if @i > 2
      #   @running = false
      # end
    end
  end

end
