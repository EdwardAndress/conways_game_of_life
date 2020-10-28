class Rule
  def self.apply_to(old_world, new_world)
    self.new(old_world, new_world).apply
  end

  def initialize(old_world, new_world)
    @old_world = old_world
    @new_world = new_world
  end
end