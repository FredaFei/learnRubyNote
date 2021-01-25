# top level scope
x = 'bob'
# class A # begin class scope
#   puts x # => error
# end # end class scope
# # back in top level scope

# The Class.new closure captures all the top level local variable bindings and makes them available in the class definition.
A = Class.new do # begin closure
  p x
end # end closure

# Module#class_eval allows scope gates for existing classes to be bypassed.
class B; end
# use class_eval to bypass the scope gate for an existing class
B.class_eval do
  p x # => local variable is accessible
end

# local variables are not accessible when
# a class is reopened with the class keyword
# class B
#   p x # => error
# end

# Method scope gates are similar to class scope gates and can be bypassed with a closure:
class C # begin class scope
  x = 'bob2'
  define_method :hi do # begin closure
    x
  end # end closure
end # end class scope
p C.new.hi # => 'bob2'

# 接下来看 scope.rb