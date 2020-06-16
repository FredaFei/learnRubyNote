# 大写字母开头即为常量
# 你如果违反这个「约定」，你会得到一个警告
#
# 常量的作用域

A = 'root A'
module MyModule
  A = 'out A'
  class MyClass
    A = 'inner A'
    p 'Module.nesting'
    p Module.nesting # 可以在任何地方使用 Module.nesting 打印出当前作用域的层级结构
  end
  p A # 'out A'
  p MyClass::A # 'inner A'
end

p 'A ___'
p A # 'root A'
p MyModule::A # 'out A'
p MyModule::MyClass::A # 'inner A'
p ::A # 'root A'

p MyModule.constants # 得到MyModule 内部的所有一级常量
p Module.constants[0..3] #得到所有顶层常量,由于顶层常量太多了，所以用 [0..3] 截取前4个

# MyModule.constants 是实例方法，Module.constants 是类方法，所以他们的作用不同

p MyModule.is_a? Module # true, 说明 MyModule 是 Module 的实例

# 接下来请看 receiver_and_ancestors_chain.rb