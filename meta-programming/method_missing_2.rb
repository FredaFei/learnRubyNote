class MyClass
  def method_missing(method, *args)
    p "method: #{method}, args: #{args}"
    p "not found #{method}"
  end
end

obj = MyClass.new
obj.xxx(1,2,3)

# method_missing 可以让一个对象响应任何方法！