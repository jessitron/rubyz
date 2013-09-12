module Either

  def self.left(leftval)
    Left.new(leftval)
  end
  def self.right(rightval)
    Right.new(rightval)
  end

  def transform(f); self end
  def left_transform(f); self end
end

private
class Left
  include Either
  def initialize(val)
    @val = val
  end

  def left?; true end
  def right?; false end

  def to_a; [] end

  def left_transform(f)
    Left.new(f.call(@val))
  end

  def fold (left, right)
    left.call(@val)
  end

  def == (other)
    other.is_a?(Left) && other.leftval == @val
  end

  # should this be public?
  def leftval; @val end

end
class Right
  include Either
  def initialize(val)
    @val = val
  end

  def left?; false end
  def right?; true end

  def to_a; [@val] end

  def transform(f)
    Right.new(f.call(@val))
  end

  def == (other)
    other.is_a?(Right) && other.val == @val
  end

  def flatten
    @val
  end

  def fold (left, right)
    right.call(@val)
  end

  attr_reader :val

end
