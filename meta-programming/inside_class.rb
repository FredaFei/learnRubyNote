class MyClass
  def initialize
    @v = 1
  end

  def add_method
    @v += 1
  end
end

obj = MyClass.new

p obj.class
p obj.add_method
p obj.instance_variables

# p obj[:@v] # 获取报错
# 在method中搜含有my的
p obj.methods.grep(/add/)
#在MyClass.instance_methods ==> obj.methods
p MyClass.instance_methods.grep(/add/)

# 总结
# 一个对象的实例变量存储在自身上
# 一个对象的方法存储在其类上
#
# 接下来看 class_in_an_object.rb