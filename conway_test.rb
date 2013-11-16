gem 'minitest'
require 'minitest/autorun'
require_relative 'cell'
require_relative 'cell_testing_methods'


class TestMeme < Minitest::Test

  def test_draw_method
    cell = Cell.new(0,0)
    assert cell.draw == [0,9,9,9,0,0,9,0]
    cell = Cell.new(1,0)
    assert cell.draw == [10,9,19,9,10,0,19,0]

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



