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
    @mines << { column: column, row: row }
  end

  def sweep
    minefield = @minefield

    @mines.each do |mine|
      x = mine[:row] - 1
      y = mine[:column] - 1

      minefield[x][y] = MINE
    end

    minefield
  end
end
