require_relative './rule'

class ReproductionRule < Rule
  def apply
    @world.dead_cells.each do |row, col|
      @next_gen.animate_cell(row, col) if @world.live_neighbour_count(row, col) == 3
    end
  end
end