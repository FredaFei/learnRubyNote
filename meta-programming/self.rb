class C
  p "class C start"
  p self
  module M
    p "module C::M:"
    p self
  end

  def x
    p "class C, method x:"
    p self
  end

  def C.y
    p "class C, method y:"
    p "self: #{self}"
  end
  def self.z
    p "class C, method z:"
    p "self: #{self}"
  end
  p "class C end"
  p self
end

c = C.new
c.x
C.y
C.z
#
# class D<C
#
# end
# D.y

# class C
#   p "C context"
#   @v = "glob v"
#   p "glob self is #{self}"
#   p @v
#   def show
#     @v = "show v"
#     p "show self is #{self}"
#     p @v
#   end
#
# end
#
# c = C.new
# c.show

# 下一章类变量语法、作用域
# 请看 class_var_scope.rb