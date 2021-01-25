# procs can be assigned to variables
multiplier = Proc.new { |x, y| x * y }
# procs can be returned from methods
def proc_returner(proc)
  proc
end

proc_returner(multiplier) # => multiplier proc
# procs can be stored in data structures
a = [multiplier]
result = a.first.call(3, 4) # => 12
p a
p result
# ruby中proc是一等公民
# method 仅仅是一个method，而没有function的特点
# function 不能作为参数，不能作为返回值，不能赋值给变量
# 接下来看 class_method.rb
proc.rb