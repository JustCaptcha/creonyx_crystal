
module State
  class Global
    getter game_over : Bool = false
    getter window = SF::RenderWindow.new(SF::VideoMode.new(800, 600), "Creonyx")
    getter mainfont = SF::Font.from_file("./resources/fonts/nasalization/nasalization-rg.ttf")
    def initialize
    end

    def end_game()
      @game_over = true
    end

  end
end
