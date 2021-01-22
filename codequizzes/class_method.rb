class Cow
  def moo
    'A method'
  end
end

c = Cow.new
method = c.method(:moo)
p method == c.method(:moo) # => true
p method.call # => 'A method'
unbound = method.unbind # => #<UnboundMethod: Cow#moo>
unbound.call # => error because UnboundMethod objects cannot be called
unbound.bind(c) # rebind the unbound method to the c object
# 接下来看 binding_class.rb