require_relative 'cell'

module CellTestingMethods
  def create_cell(neighbor_count=0)
    cell = Cell.new
    cell.neighbor_count = neighbor_count
    cell.living = true
    cell
  end
end