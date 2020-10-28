require_relative './game_runner'

WIDTH = 100
HEIGHT = 50
GENERATIONS = 100

seeds = []

((WIDTH * HEIGHT) / 10).times do
  seeds << [rand(HEIGHT - 1), rand(WIDTH - 1)]
end

world = World.new(WIDTH, HEIGHT, seeds)
rules = [
  ReproductionRule,
  OverpopulationRule,
  UnderpopulationRule,
  PreservationRule
]
clock = Clock.new(rules)
game_runner = GameRunner.new(world: world, clock: clock)
game_runner.run(GENERATIONS)