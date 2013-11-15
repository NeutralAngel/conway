class Cell
  attr_accessor :neighbour_count, :living

  def tick
  end

  def alive?
    if @living then
      @living = false unless (2..3).include?(@neighbour_count)
      return @living
    else
      if @neighbour_count == 3
        @living = true
      end
    end
  end
end