require 'gosu'
require_relative 'gameboard'

class MyWindow < Gosu::Window
  def initialize
    if ARGV[0].downcase.eql?("help")
      puts "Accepted arguments: glider, gosper, acorn, ten"
      abort
    end
    super 1000, 1000, false
    self.caption = "Conway\'s Game of Life"
    @color = Gosu::Color.new(0xFF1EB1FA)
    @black = Gosu::Color.new(0x00000000)
    @gameboard = GameBoard.new(100)

    case ARGV[0]
    when "glider"
      create_glider
    when "gosper"
      create_gosper
    when "acorn"
      create_acorn
    when "ten"
      ten_cell
    else
      create_infinite
    end
  end

  def create_cell(x,y)
    @gameboard.cells[x][99-y].living = true
  end

  def update
    @gameboard.tick
  end

  def draw
    @gameboard.cells.each do |column|
      column.each do |cell|
        if cell.alive?
          draw_it(cell.draw)
        else
          draw_it(cell.draw, @black)
        end
      end
    end
  end

  def draw_it(coordinates, color=@color)
    draw_quad(coordinates[:left_x],coordinates[:top_y],color,
              coordinates[:right_x],coordinates[:top_y],color,
              coordinates[:left_x],coordinates[:bottom_y],color,
              coordinates[:right_x],coordinates[:bottom_y],color,
              0)
  end

  def create_infinite
    create_cell(31,50)
    create_cell(32,50)
    create_cell(33,50)
    create_cell(34,50)
    create_cell(35,50)
    create_cell(36,50)
    create_cell(37,50)
    create_cell(38,50)

    create_cell(40,50)
    create_cell(41,50)
    create_cell(42,50)
    create_cell(43,50)
    create_cell(44,50)

    create_cell(48,50)
    create_cell(49,50)
    create_cell(50,50)

    create_cell(57,50)
    create_cell(58,50)
    create_cell(59,50)
    create_cell(60,50)
    create_cell(61,50)
    create_cell(62,50)
    create_cell(63,50)

    create_cell(65,50)
    create_cell(66,50)
    create_cell(67,50)
    create_cell(68,50)
    create_cell(69,50)
  end

  def create_gosper
    create_cell(40,50)
    create_cell(40,51)
    create_cell(41,50)
    create_cell(41,51)

    create_cell(50,49)
    create_cell(50,50)
    create_cell(50,51)
    create_cell(51,48)
    create_cell(51,52)
    create_cell(52,47)
    create_cell(52,53)
    create_cell(53,47)
    create_cell(53,53)
    create_cell(54,50)
    create_cell(55,48)
    create_cell(55,52)
    create_cell(56,49)
    create_cell(56,50)
    create_cell(56,51)
    create_cell(57,50)

    create_cell(60,51)
    create_cell(60,52)
    create_cell(60,53)
    create_cell(61,51)
    create_cell(61,52)
    create_cell(61,53)
    create_cell(62,50)
    create_cell(62,54)
    create_cell(64,49)
    create_cell(64,50)
    create_cell(64,54)
    create_cell(64,55)

    create_cell(74,52)
    create_cell(74,53)
    create_cell(75,52)
    create_cell(75,53)
  end

  def ten_cell
    create_cell(50,50)
    create_cell(52,50)
    create_cell(52,51)
    create_cell(54,52)
    create_cell(54,53)
    create_cell(54,54)
    create_cell(56,53)
    create_cell(56,54)
    create_cell(56,55)
    create_cell(57,54)
  end

  def create_acorn
    create_cell(50,50)
    create_cell(51,50)
    create_cell(51,52)
    create_cell(53,51)
    create_cell(54,50)
    create_cell(55,50)
    create_cell(56,50)
  end

  def create_glider
    create_cell(50,50)
    create_cell(51,50)
    create_cell(51,52)
    create_cell(52,50)
    create_cell(52,51)
  end
end

window = MyWindow.new
window.show