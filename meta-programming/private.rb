# 方法分为 public / private 和 protected
# 默认就是 public，使用 private 开始声明私有方法

class MyClass
  def public_method
    'MyClass#public_method'
  end

  def public_call_private
    self.private_method_1
  end

  def public_call_private_without_self
    private_method_1
  end

  private

  def private_method_1
    'MyClass#private_method_1'
  end

  def private_method_2
    'MyClass#private_method_2'
  end
end

obj = MyClass.new
p obj.public_method
p obj.send(:public_method)
# 以上两行代码等价
# send 私有方法还是会被调用
p obj.send(:private_method_1)
# public_send 保证私有方法不会被调用
# p obj.public_send(:private_method_1)
# p obj.public_call_private
p obj.public_call_private_without_self

# 结论
# 私有方法的调用必须满足如下情况
# 1. 必须在对象所在的类里面调用（作用域很小）
# 2. 不能在前面加 self. 字样（只能隐式指定 self）

# 接下来看 dynamic_methods.rb
