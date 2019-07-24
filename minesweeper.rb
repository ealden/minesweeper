class Minesweeper
  MINE = '*'

  def initialize length: 0, height: 0
    @length = length
    @height = height

    @minefield = create_minefield length, height
    @mines = []
  end

  def add_mine column:, row:
    x = row - 1
    y = column - 1

    @mines << { x: x, y: y }

    @minefield[x][y] = MINE
  end

  def sweep
    minefield = @minefield

    @mines.each do |mine|
      sweep_around minefield, mine
    end

    minefield
  end

  private

  def create_minefield length, height
    minefield = []

    height.times do
      row = []

      length.times do
        row << 0
      end

      minefield << row
    end

    minefield
  end

  OFFSETS = {
    N:  { x:  0, y: -1 },
    NE: { x:  1, y: -1 },
    E:  { x:  1, y:  0 },
    SE: { x:  1, y:  1 },
    S:  { x:  0, y:  1 },
    SW: { x: -1, y:  1 },
    W:  { x: -1, y:  0 },
    NW: { x: -1, y: -1 }
  }

  def sweep_around minefield, mine
    OFFSETS.each_value do |offset|
      x = mine[:x] + offset[:x]
      y = mine[:y] + offset[:y]

      x_within_bounds = ((x >= 0) and (x < @length))
      y_within_bounds = ((y >= 0) and (y < @height))

      if x_within_bounds and y_within_bounds
        value = minefield[x][y]

        (minefield[x][y] = value + 1) unless value == MINE
      end
    end
  end
end
