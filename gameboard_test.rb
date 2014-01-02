gem 'minitest'
require 'minitest/autorun'
require_relative 'gameboard'


class GameBoardTest < Minitest::Test

  def setup
    @gameboard = GameBoard.new(3)
  end

  def test_gameboard_is_created
    assert @gameboard.cells.length == 3
    assert @gameboard.cells[0].length == 3
  end

  def test_no_living_neighbors
    create_living_cell(1,1)
    @gameboard.tick
    assert @gameboard.cells[1][1].neighbor_count == 0
  end

  def test_neighbors_on_left
    create_living_cell(1,1)
    create_living_cell(0,0)
    create_living_cell(0,1)
    create_living_cell(0,2)
    @gameboard.tick
    assert @gameboard.cells[1][1].neighbor_count == 3
    assert @gameboard.cells[0][0].neighbor_count == 2

  end

  def create_living_cell(x,y)
    @gameboard.cells[x][y].living = true
  end

end