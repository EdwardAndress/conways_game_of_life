require_relative './game_runner'
require_relative './glider_gun'

WIDTH = 100
HEIGHT = 40
GENERATIONS = 100

# seeds = []

# ((WIDTH * HEIGHT) / 10).times do
#   seeds << [rand(HEIGHT - 1), rand(WIDTH - 1)]
# end

world = World.new(seeds: glider_gun, height: HEIGHT, width: WIDTH)
game_runner = GameRunner.new(world: world)
game_runner.run