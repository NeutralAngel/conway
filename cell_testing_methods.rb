require_relative 'cell'

module CellTestingMethods
  def create_cell(neighbour_count=0)
    cell = Cell.new
    cell.neighbour_count = neighbour_count
    cell.living = true
    cell
  end
end