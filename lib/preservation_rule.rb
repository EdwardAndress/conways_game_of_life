require_relative './rule'

class PreservationRule < Rule
  def apply
    @world.live_cells.each do |row, col|
      @next_gen.animate_cell(row, col) if
        @world.live_neighbour_count(row, col) == 3 ||
        @world.live_neighbour_count(row, col) == 2
    end
  end
end