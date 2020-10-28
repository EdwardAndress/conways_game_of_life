class Rule
  def self.apply_to(world, next_gen)
    self.new(world, next_gen).apply
  end

  def initialize(world, next_gen)
    @world = world
    @next_gen = next_gen
  end
end