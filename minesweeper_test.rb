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

  def test_must_sweep_4x4_minefield_with_a_mine_at_1_1
    expected = [
      ['*', 1, 0, 0],
      [ 1 , 1, 0, 0],
      [ 0 , 0, 0, 0],
      [ 0 , 0, 0, 0]
    ]

    minesweeper = Minesweeper.new length: 4,
                                  height: 4

    minesweeper.add_mine column: 1, row: 1

    actual = minesweeper.sweep

    assert_equal expected, actual
  end

  def test_must_sweep_4x4_minefield_with_a_mine_at_2_3
    expected = [
      [0,  0 , 0, 0],
      [1,  1 , 1, 0],
      [1, '*', 1, 0],
      [1,  1 , 1, 0]
    ]

    minesweeper = Minesweeper.new length: 4,
                                  height: 4

    minesweeper.add_mine column: 2, row: 3

    actual = minesweeper.sweep

    assert_equal expected, actual
  end

  def test_must_sweep_4x4_minefield_with_mines_at_1_1_and_2_3
    expected = [
      ['*',  1 , 0, 0],
      [ 2 ,  2 , 1, 0],
      [ 1 , '*', 1, 0],
      [ 1 ,  1 , 1, 0]
    ]

    minesweeper = Minesweeper.new length: 4,
                                  height: 4

    minesweeper.add_mine column: 1, row: 1
    minesweeper.add_mine column: 2, row: 3

    actual = minesweeper.sweep

    assert_equal expected, actual
  end

  def test_must_sweep_4x4_minefield_with_mines_at_1_1_and_2_1
    expected = [
      ['*', '*', 1, 0],
      [ 2 ,  2 , 1, 0],
      [ 0 ,  0 , 0, 0],
      [ 0 ,  0 , 0, 0]
    ]

    minesweeper = Minesweeper.new length: 4,
                                  height: 4

    minesweeper.add_mine column: 1, row: 1
    minesweeper.add_mine column: 2, row: 1

    actual = minesweeper.sweep

    assert_equal expected, actual
  end

  def test_must_sweep_4x4_minefield_with_mines_at_the_center!
    expected = [
      [1,  2 ,  2 , 1],
      [2, '*', '*', 2],
      [2, '*', '*', 2],
      [1,  2 ,  2 , 1]
    ]

    minesweeper = Minesweeper.new length: 4,
                                  height: 4

    minesweeper.add_mine column: 2, row: 2
    minesweeper.add_mine column: 3, row: 2
    minesweeper.add_mine column: 2, row: 3
    minesweeper.add_mine column: 3, row: 3

    actual = minesweeper.sweep

    assert_equal expected, actual
  end

  def test_must_sweep_4x4_minefield_with_mines_near_right_edge
    expected = [
      [2, '*', '*', 1],
      [3, '*',  4 , 1],
      [3, '*',  4 , 1],
      [2, '*', '*', 1]
    ]

    minesweeper = Minesweeper.new length: 4,
                                  height: 4

    minesweeper.add_mine column: 2, row: 1
    minesweeper.add_mine column: 3, row: 1
    minesweeper.add_mine column: 2, row: 2
    minesweeper.add_mine column: 2, row: 3
    minesweeper.add_mine column: 2, row: 4
    minesweeper.add_mine column: 3, row: 4

    actual = minesweeper.sweep

    assert_equal expected, actual
  end
end
