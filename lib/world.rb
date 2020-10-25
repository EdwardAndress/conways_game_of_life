# the world doesn't decide who lives or dies
# but it knows who is alive and who is dead
# and it can carry out the deeds of a higher power

class World

  def initialize(width, height, seed_indices = [])
    @height = height
    @width = width
    @cells = create_cells
    add_seeds(seed_indices) if seed_indices.any?
  end

  def create_cells
    (1..@height).map do
      (1..@width).map do
        '•'
      end
    end
  end

  def live_cells
    @cells.each_with_index.map do |row, row_index|
      row.each_with_index.map do |cell, col_index|
        [row_index, col_index] if alive?(cell)
      end.compact
    end.compact.flatten(1)
  end

  def dead_cells
    @cells.each_with_index.map do |row, row_index|
      row.each_with_index.map do |cell, col_index|
        [row_index, col_index] if dead?(cell)
      end.compact
    end.compact.flatten(1)
  end

  def neighbours_of(row, col)
    [
      [row - 1, col - 1],
      [row - 1, col],
      [row - 1, (col + 1) % @width],
      [row, col - 1],
      [row, (col + 1) % @width],
      [(row + 1) % @height, col - 1],
      [(row + 1) % @height, col],
      [(row + 1) % @height, (col + 1) % @width]
    ]
  end

  def live_neighbour_count(row, col)
    neighbours_of(row, col).each_with_object([]) do |coords, live_cell_coords|
      live_cell_coords << coords if alive_at?(coords)
    end.count
  end

  def animate_cell(row, col)
    @cells[row][col] = ''
  end

  def kill_cell(row, col)
    @cells[row][col] = '•'
  end

  def add_seeds(seed_indices)
    seed_indices.each do |row, col|
      @cells[row][col] = ''
    end
  end

  def alive_at?(coords)
    cell = @cells[coords.first][coords.last]
    alive?(cell)
  end

  def alive?(cell)
    cell == ''
  end

  def dead?(cell)
    cell == '•'
  end
end