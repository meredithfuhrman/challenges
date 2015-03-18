class BoundingArea

  def initialize(array_of_boxes)
    @boxes = array_of_boxes
  end

  def contains_point?(x,y)
    if @boxes == []
      false
    else
      return @boxes.any? { |box| box.contains_point?(x,y) }
    end
  end
end
