require_relative './game_runner'

WIDTH = 50
HEIGHT = 50
GENERATIONS = 100

seeds = []

((WIDTH * HEIGHT) / 10).times do
  seeds << [rand(WIDTH - 1), rand(HEIGHT - 1)]
end

world = World.new(WIDTH, HEIGHT, seeds)
rules = [ReproductionRule, OverpopulationRule, UnderpopulationRule]
clock = Clock.new(rules)
game_runner = GameRunner.new(world: world, clock: clock)
game_runner.run(GENERATIONS)