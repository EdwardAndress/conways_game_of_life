require_relative 'world'
require_relative 'clock'
require_relative 'overpopulation_rule'
require_relative 'underpopulation_rule'
require_relative 'reproduction_rule'

class GameRunner
  def initialize(world:, clock:)
    @world = world
    @clock = clock
  end

  def display_world
    @world.cells.each do |row|
      puts row.join
    end
  end

  def clear_screen
    system 'clear'
  end

  def run(generations)
    generations.times do |count|
      display_world
      @clock.tick(@world)
      sleep 0.5
      clear_screen
    end
  end
end