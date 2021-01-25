x = 'bob'
r = ['a', 'c']
# block has access to the local variable x
r.each { |e| e.replace(x) } # block is defined when each() method is called

def a_method
  yield
end

x = 42
@y = 33

def hi; 'hey'; end

# block has access to current scope bindings when it's defined
a_method do
  p "self: #{self}" # => "self: main"
  p "x: #{x}" # => "x: 42"
  p "y: #{@y}" # => "y: 33"
  p "hi(): #{hi}" # => "hi(): hey"
end

def yielder
  yield
end

yielder do
  # create a new binding (z) for the block
  z = 'zee'
  p z # => "zee"
end

# binding from the block is no longer available
# p z # undefined local variable or method `z' for main:Object (NameError)

a = 'aaa'

yielder do |a| # block variable conflicts with local binding
  p "before a #{a}" # nil
  a = 'zzz'
  p a # => 'zzz'
end

# 接下来看 method_missing.rb