require 'minitest/autorun'

require_relative 'minesweeper'

class MinesweeperTest < Minitest::Test
  def test_must_show_empty_minefield
    expected = []

    minesweeper = Minesweeper.new

    actual = minesweeper.sweep

    assert_equal expected, actual
  end

  def test_must_show_4x4_minefield
    expected = [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0]
    ]

    minesweeper = Minesweeper.new length: 4,
                                  height: 4

    actual = minesweeper.sweep

    assert_equal expected, actual
  end
end
