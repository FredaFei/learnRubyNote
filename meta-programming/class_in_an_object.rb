p 'hello'.class # String
p String.class # Class

# 记得吗，对象的add_method 是定义在 class MyClass 里的
# String当做一个对象时，它的类是 Class
# 那么String.xxx 的 xxx 方法其实是定义在 class Class 里的

p Class.instance_methods(false) # [:allocate, :new, :superclass]
# 因此 String.new 之所以可以调用，是因为 class Class 里面 def new 了

p 'hello'.is_a? String # true
p 'world'.is_a? String # true
p String.is_a? Class # true,说明String是Class的实例
p Array.is_a? Class # true,说明Array是Class的实例

# 总结
# 所有类都是Class的实例
# Class也是类
# Class 是 Class 的实例吗？ yes
#
# 一个类继承了另一个类，而非'hello' 继承了 String
#
# 实例：对象b是类B的实例，意味着对象__b__拥有类__B__定义的方法和属性
# 继承：类A继承了类B，意味着类A的对象__a__拥有类__B__定义的方法和属性
#
# 接下来看 superclass.rb
