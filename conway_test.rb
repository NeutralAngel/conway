gem 'minitest'
require 'minitest/autorun'
require_relative 'cell'
require_relative 'cell_testing_methods'


class TestMeme < Minitest::Test

  def test_draw_method
    cell = Cell.new(0,0)
    coordinates = cell.draw
    coordinates[:left_x] == 0
    coordinates[:right_x] == 9
    coordinates[:top_y] == 9
    coordinates[:bottom_y] == 0
    cell = Cell.new(1,0)
    coordinates = cell.draw
    coordinates[:left_x] == 10
    coordinates[:right_x] == 19
    coordinates[:top_y] == 9
    coordinates[:bottom_y] == 0
  end

  describe Cell do
    include CellTestingMethods

      describe "live cell with fewer than two live neighbours" do
        it "dies" do
          cell = create_cell
          cell.tick
          refute cell.alive?, "Cell should not be alive." 
        end
      end

      describe "live cell with two or three live neighbours" do
        it "stays alive" do
          cell = create_cell(2)
          cell.tick
          assert cell.alive?, "Cell should be alive."
        end
      end

      describe "live cell with more than three live neighbours" do
        it "dies" do
          cell = create_cell(4)
          cell.tick
          refute cell.alive?, "Cell should not be alive."
        end
      end

      describe "dead cell with exactly three live neighbours" do
        it "becomes alive" do
          cell = create_cell(3)
          cell.living = false
          cell.tick
          assert cell.alive?, "Cell should be alive."
        end
      end

  end



end



