class A
  def hi
    @a = 'a'
    b = 'b'
    binding
  end
end

binding = A.new.hi # returns a binding object
p eval("b.concat('aaaaa')", binding) # => "baaaaa"
p eval("self", binding) # => "baaaaa" # => #<A:0x007f87022c8ce8 @a="a">
p eval("instance_variable_get('@a')", binding) # => "a"
p binding.eval("b") # => "baaaaa"
p eval("b", binding)
@test = 'haha'
module M
  def self.hi
    eval("@test", TOPLEVEL_BINDING)
  end
end
p M::hi

# 接下来看 open_struct_method_missing.rb
