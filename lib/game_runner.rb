require_relative 'world'
require_relative 'clock'
require_relative 'overpopulation_rule'
require_relative 'underpopulation_rule'
require_relative 'reproduction_rule'
require_relative 'preservation_rule'

class GameRunner

  DEFAULT_GENERATIONS = 100

  def initialize(world:, clock: Clock.new)
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

  def run(generations = DEFAULT_GENERATIONS)
    generations.times do |count|
      display_world
      @world = @clock.tick(@world)
      clear_screen
    end
  end
end