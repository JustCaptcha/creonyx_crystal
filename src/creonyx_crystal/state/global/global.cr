
module State
  class Global
    getter game_over : Bool
    getter window : SF::RenderWindow
    getter mainfont : SF::Font
    def initialize
      @game_over = false
      @window = SF::RenderWindow.new(SF::VideoMode.new(800, 600), "Creonyx")
      @mainfont = SF::Font.from_file("./resources/fonts/nasalization/nasalization-rg.ttf")
    end

    def end_game()
      @game_over = true
    end

  end
end
