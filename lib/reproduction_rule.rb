class ReproductionRule
  def self.apply_to(world, next_gen)
    self.new(world, next_gen).apply
  end

  def initialize(world, next_gen)
    @world = world
    @next_gen = next_gen
  end

  def apply
    @world.dead_cells.each do |row, col|
      @next_gen.animate_cell(row, col) if @world.live_neighbour_count(row, col) == 3
    end
  end
end