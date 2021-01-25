module Calculator
  def self.about
    'I like computation'
  end
  
  def add(x, y)
    x + y
  end
end

class A
  include Calculator
  
  def x
    p 'A method x'
    # module singleton method
    Calculator::about
  end
end

# instance methods are accessible
p A.new.add(3, 4) # => 56
p A.new.x
# singleton methods are not included in the class
# p A.about # => error


p 'Calculator---'
p Calculator.about
# 实例方法（instance method）
# p Calculator.add 1, 4 #error
p Calculator.singleton_methods
p Calculator.instance_methods
# 接下来看 flattening_the_scope.rb