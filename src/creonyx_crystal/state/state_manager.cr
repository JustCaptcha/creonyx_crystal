require "./global"

module State
  class StateManager
    getter global : State::Global
    # getter hero = State::Hero
    # getter creatures = State::Creatures
    def initialize()
      @global = State::Global.new()
    end
    def delete()

    end
  end
end

