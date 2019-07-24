require 'minitest/autorun'

require_relative 'minesweeper'

class MinesweeperTest < Minitest::Test
  def test_must_show_empty_minefield
    expected = []

    minesweeper = Minesweeper.new

    actual = minesweeper.sweep

    assert_equal expected, actual
  end
end
