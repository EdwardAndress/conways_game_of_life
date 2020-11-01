require_relative './game_runner'

WIDTH = 100
HEIGHT = 40
GENERATIONS = 100

seeds = []

((WIDTH * HEIGHT) / 10).times do
  seeds << [rand(HEIGHT - 1), rand(WIDTH - 1)]
end

world = World.new(seeds: seeds, height: HEIGHT, width: WIDTH)
game_runner = GameRunner.new(world: world)
game_runner.run