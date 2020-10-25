class ReproductionRule
  def self.apply_to(world)
    self.new(world).apply
  end

  def initialize(world)
    @world = world
  end

  def apply
    @world.dead_cells.each do |row, col|
      @world.animate_cell(row, col) if @world.live_neighbour_count(row, col) == 3
    end
  end
end