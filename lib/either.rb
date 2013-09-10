class Either

  def self.left(leftval)
    new(left: leftval)
  end


   attr_reader :left, :right
   def initialize(left: :none, right: :none)
      raise ArgumentError.new("Either a right or an left please, not both") if (right != :none and left != :none)
      raise ArgumentError.new("Either a right or an left please, please give me one") if (right == :none and left == :none)
      @right = right
      @left = left
   end

   def left?
     @left != :none
   end
end
