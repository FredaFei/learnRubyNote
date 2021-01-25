# The methods() and respond_to?() methods will not register the new messages objects can deal with when message_missing is customized.
# class Dude
#   def method_missing(name, *args)
#     return super unless [:haircut, :flow, :dome_style].include?(name)
#     'radical haircut'
#   end
# end

# p Dude.new.haircut # => 'radical haircut'
# p Dude.new.undefined_method # => NoMethodError: undefined method `undefined_method'

class A
  def method_missing(name, *args)
    return "hi" if name == :hello
  end
end

a = A.new
p a.hello # => 'hi'
p a.respond_to? :hello # => false
p a.methods.include? :hello # => false


class Person
  def initialize
    @first_name = 'bob'
    @last_name = 'lob'
  end
  
  def method_missing(name, *args)
    iv = "@#{name.to_s}"
    if instance_variables.include?(iv.to_sym)
      instance_variable_get(iv)
    else
      super
    end
  end
end

p = Person.new
# instance variables are accessible as methods
p p.first_name # => "bob"
p p.last_name # => "lob"

# Kernel#method_missing is still called for messages
# that don't correspond to instance variable names
# p.phattie # => NoMethodError: undefined method `phattie'

# when new instance variables are defined, they are accessible
p p.instance_variable_set(:@height, "six foot") # => "six foot"
p p.height # => "six foot"

# 接下来看 reader_attr.rb