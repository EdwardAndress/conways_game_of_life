require_relative './game_runner'

WIDTH = 100
HEIGHT = 50
GENERATIONS = 100

seeds = []

((WIDTH * HEIGHT) / 10).times do
  seeds << [rand(HEIGHT - 1), rand(WIDTH - 1)]
end

world = World.new(seeds: seeds)
game_runner = GameRunner.new(world: world)
game_runner.run