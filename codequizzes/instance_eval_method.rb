class A
  def initialize
    @crunk = 'yeahya'
  end
  
  def grill
    'platinum'
  end
  
  private
  
  def rapper
    'lil john'
  end
end

a = A.new
a.instance_eval do
  p self # => #<A:0x007fbf1b3313a0 @crunk="yeahya">
  p @crunk # => "yeahya"
  p grill # => "platinum"
  p rapper # => "lil john"
end
test = Object.new
test.instance_variable_set(:@b, 'bbb')
test.instance_eval do
  @b = 'new bbb'
end
p test.instance_variable_get(:@b) #"new bbb"
obj = Object.new
obj.instance_eval do
  def hi
    'object custom hi'
  end
end
p obj.hi
p obj.singleton_methods # [:hi]
# p Object.new.hi # error
#hi method 仅当前obj实例有效
#接下来看 module.rb