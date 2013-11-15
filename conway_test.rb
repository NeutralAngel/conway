gem 'minitest'
require 'minitest/autorun'
require_relative 'cell'
require_relative 'cell_testing_methods'


class TestMeme < Minitest::Test

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



