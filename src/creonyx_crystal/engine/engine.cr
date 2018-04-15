require "./renderer"

module Engine
  class Engine
    def initialize()
      @render = Render::Render.new()
    end
    def run()
      puts "Engine run!"
      @render.update()
    end
    def handle_events()

    end
  end
end
