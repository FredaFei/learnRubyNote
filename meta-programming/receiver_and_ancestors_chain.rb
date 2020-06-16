# 消息、接受者与祖先链
# 接收者 - my_string.reverse() 中的 my_string 就是接受者
# 祖先链 - 从一个类，经过它的超类、超类的超类……一直到达 BasicObject 类，这个路径就是该类的祖先链

# 方法查找：顺着祖先链向上查找

class MyClass
  def my_method
    'my_method()'
  end
end

class MySubClass < MyClass

end

obj = MySubClass.new

p obj.my_method

p MySubClass.ancestors

# Kernel 是一个模块，这说明祖先链除了类，还包含模块

# 接下来看 include.rb