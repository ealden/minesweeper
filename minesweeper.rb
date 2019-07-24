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

    x = row - 1
    y = column - 1

    @minefield[x][y] = MINE
  end

  def sweep
    @minefield
  end
end
