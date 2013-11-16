class Cell
  attr_accessor :neighbor_count, :living, :x, :y

  def initialize(x=nil, y=nil)
    @x = x
    @y = y
    @neighbor_count = 0
    @living = false
  end

  def tick
    if @living then
      @living = false unless (2..3).include?(@neighbor_count)
      return @living
    else
      if @neighbor_count == 3
        @living = true
      end
    end
  end

  def alive?
    @living
  end

  def draw
    left_x = @x * 10
    right_x = ((@x + 1) * 10) - 1
    top_y = ((@y + 1) * 10) - 1
    bottom_y = @y * 10
    {left_x: left_x, right_x: right_x, top_y: top_y, bottom_y: bottom_y}
  end


end