class Cell
  attr_accessor :neighbour_count, :living

  def tick
  end

  def alive?
    if @living then
      case @neighbour_count
      when 0..1
        @living = false
      when 2..3
        @living = true
      else
        @living = false
      end
    else
      if @neighbour_count = 3
        @living = true
      end
    end
  end
end