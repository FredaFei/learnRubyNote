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
    p Calculator::about
    p '---'
  end
end

# instance methods are accessible
p A.new.add(3, 4) # => 56
p A.new.x
# singleton methods are not included in the class
# p A.about # => error
p Calculator::about