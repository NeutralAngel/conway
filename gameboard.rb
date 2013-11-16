require_relative 'cell'
require 'pry'

class GameBoard

  attr_accessor :size, :cells

  def initialize(size)
    @size = size
    @cells = Array.new
    size.times do |x|
      @cells << Array.new
      size.times do |y|
        @cells[x][y] = Cell.new(x, y)
      end
    end 
  end

  def tick
    @cells.each do |column|
      column.each do |cell|
        cell.neighbor_count = count_neighbors(cell)
      end
    end
    @cells.each do |column|
      column.each do |cell|
        cell.tick
      end
    end
  end

  def count_neighbors(cell)
    count(cell, :left) + count(cell, :same) + count(cell, :right)  
  end

  def count(cell, side)
    case side
    when :left
      offset = -1
    when :same
      offset = 0
    when :right
      offset = 1
    end

    count = 0
    column = cell.x + offset
    if !in_bounds?(column)
      count
    else
      if in_bounds?(cell.y-1)
        count += 1 if @cells[column][cell.y-1].alive?
      end
      if in_bounds?(cell.y+1)
        count += 1 if @cells[column][cell.y+1].alive?
      end
      if side != :same
        count += 1 if @cells[column][cell.y].alive? 
      end
    end
    count
  end

  def in_bounds?(value)
    value >= 0 && value < (@size)
  end

end