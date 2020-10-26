require_relative './interface'

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
interface = Interface.new(world: world, clock: clock)
interface.run(GENERATIONS)