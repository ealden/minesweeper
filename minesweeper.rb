class Minesweeper
  MINE = '*'

  def initialize length: 0, height: 0
    @minefield = []
    @mines = []

    height.times do
      row = []

      length.times do
        row << 0
      end

      @minefield << row
    end
  end

  def add_mine column:, row:
    x = row - 1
    y = column - 1

    @mines << { column: y, row: x }

    @minefield[x][y] = MINE
  end

  def sweep
    minefield = @minefield

    @mines.each do |mine|
      x = mine[:row]
      y = mine[:column]

      minefield[x + 1][y] = minefield[x + 1][y] + 1 # E
      minefield[x][y + 1] = minefield[x][y + 1] + 1 # S

      minefield[x + 1][y + 1] = minefield[x + 1][y + 1] + 1 # NE
    end

    minefield
  end
end
