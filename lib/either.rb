class Either
   attr_reader :left, :right
   def initialize(left, right)
      raise ArgumentError.new("Either a right or an left please, not both") if (right != :none and left != :none)
      raise ArgumentError.new("Either a right or an left please, please give me one") if (right == :none and left == :none)
      @right = right
      @left = left
   end
end
