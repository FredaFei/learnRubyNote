p String.class # Class
p String.superclass # Object
p Object.superclass # BasicObject
p BasicObject.superclass # nil

class MyClass;
end
p MyClass.class # Class
p MyClass.superclass # Object
p MyClass.is_a? Class

p Class is_a? Class # true
# 所有类都是 Class 类的实例,而 Class 也是类，所以它当然是 Class 的实例

p Class.superclass # Module

# 一个对象有哪些属性：
# 1. 先看自身存储了哪些方法或属性
# 2. 再看类定义了哪些方法或属性
# 3. 再看类的父类定义了哪些方法或属性

# 接下来打开 constant.rb