class Minesweeper
  def initialize length: 0, height: 0
    @minefield = []

    height.times do
      row = []

      length.times do
        row << 0
      end

      @minefield << row
    end
  end

  def sweep
    @minefield
  end
end
