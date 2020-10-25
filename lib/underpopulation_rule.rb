class UnderpopulationRule
  def self.apply_to(world)
    self.new(world).apply
  end

  def initialize(world)
    @world = world
  end

  def apply
    @world.live_cells.each do |row, col|
      @world.kill_cell(row, col) if @world.live_neighbour_count(row, col) < 2
    end
  end
end