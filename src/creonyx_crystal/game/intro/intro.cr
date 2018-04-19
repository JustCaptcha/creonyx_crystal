# This module show intro section
# TODO: 1. Project Stats (version, etc.)
#       2. Logo
#       3. Strart souns, music. (need audio fibre)
module Intro
  class Intro
    getter window : SF::RenderWindow
    getter running : Bool = false
    @i = 0 #counter
    # FIXME: temp font, need add import
    getter mainfont = SF::Font.from_file("./resources/fonts/nasalization/nasalization-rg.ttf")
    def initialize(window : SF::RenderWindow)
      @window = window
      @running = true
    end

    def show()
      # stats = Stats.new(window)
      # stats.show()
      while @running == true
        update()
        @i += 1
        puts @i
        if @i > 4
          @running = false
        end
        while event = window.poll_event
          check(event)
        end
      end
    end

    def display()
      # window.draw() Stats
    end

    def update(*context)
      window.clear(SF::Color::White)
      # text = SF::Text.new
      # text.font = mainfont
      # text.string = "Creonyx"
      # text.character_size = 64
      # text.color = SF::Color::Black
      # text.style = (SF::Text::Bold)
      # window.draw()
      window.display()
      sleep 1.seconds
    end

    def check(event)
      if event.is_a? SF::Event::Closed
        @running = false
        window.close
      end
      if event.is_a? SF::Event::KeyPressed
        if event.code = SF::Keyboard::Escape
          @running = false
        end
      end
    end
  end
  class Stats
    getter window : SF::RenderWindow
    getter texts : Hash(SF::Text, String | SF::Text)
    # getter logo : SF::Text
    def initialize(window : SF::RenderWindow)
      @window = SF::RenderWindow
      @texts = {"name" => SF::Text.new,
                "version" => SF::Text.new,
                "creater" => SF::Text.new}
      # @logo = SF::Text.new
    end
    def show()
      @texts.each do |test|
        puts test
      end
    end
  end
end
