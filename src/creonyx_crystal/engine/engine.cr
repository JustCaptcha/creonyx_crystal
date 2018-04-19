require "./renderer"
require "./audio"
require "./logger"

module Engine
  class Engine
    getter renderer : Renderer::Renderer
    getter audio : Audio::AudioManager
    def initialize()
      @renderer = Renderer::Renderer.new()
      @audio = Audio::AudioManager.new()
    end
    def run()
      puts "Engine run!"
      renderer.run()
      audio.run()
    end
    def close()
      puts "Engine close!"
      # Close all
    end
  end
end
