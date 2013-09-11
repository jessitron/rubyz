module Either

  def self.left(leftval)
    Left.new(leftval)
  end
  def self.right(rightval)
    Right.new(rightval)
  end

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
end
class Right
  include Either
  def initialize(val)
    @val = val
  end

  def left?; false end
  def right?; true end

  def to_a; [@val] end

end
