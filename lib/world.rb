class World

  def initialize(width, height, seed_indices = [])
    @cells = Array.new(width * height, '•')
    add_seeds(seed_indices) if seed_indices.any?
  end

  def live_cells
    @cells.each_with_index.map do |cell, index|
      index if alive?(cell)
    end.compact
  end

  def dead_cells
    @cells.each_with_index.map do |cell, index|
      index if dead?(cell)
    end.compact
  end

  def animate_cell(index)
    @cells[index] = ''
  end

  def kill_cell(index)
    @cells[index] = '•'
  end

  def add_seeds(seed_indices)
    seed_indices.each do |seed_index|
      @cells[seed_index] = ''
    end
  end

  def alive?(cell)
    cell == ''
  end

  def dead?(cell)
    cell == '•'
  end
end