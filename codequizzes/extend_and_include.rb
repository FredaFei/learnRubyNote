# module AAA
#   def hi
#     'hey'
#   end
# end
#
# class BBB
#   include AAA
# end
# # p BBB.hi # error undefined method `hi' for BBB:Class
# p BBB.singleton_methods.include?(:hi) # false
# p BBB.instance_methods().include?(:hi) # true
# p BBB.new.hi
# 总结：include instance_methods
# module AAA
#   def hi
#     'hey'
#   end
# end
#
# class BBB
#   extend AAA
# end
# p BBB.hi # hey
# p BBB.singleton_methods.include?(:hi) # true
# p BBB.instance_methods.include?(:hi) # false
# p BBB.new.hi # undefined method `hi' for #<BBB:0x0000000005173d88> (NoMethodError)
# 总结：extend singleton_methods
module AAA
  def hi
    'hey'
  end
end

class BBB
  # class BBB
  #   #   extend AAA
  #   # end
  # 该方式与以上代码相同
  class << self
    include AAA
  end
end

p BBB.hi # => 'hey'
p BBB.singleton_methods.include?(:hi) # true
p BBB.instance_methods.include?(:hi) # false

module ExtraStuff
  def self.included(base)
    p base
    # base is the class that invokes include() - CCC in this example
    base.extend(SingletonMethods)
  end
  
  def instance_method_hi
    "instance_method"
  end
  
  module SingletonMethods
    def single_method_hi
      "sing_method"
    end
  end
end

class CCC
  include ExtraStuff
end

p CCC.new.instance_method_hi # => "instance_method"
p CCC.single_method_hi # => "sing_method"
# p CCC.instance_method_hi # undefined method `instance_method_hi' for CCC:Class (NoMethodError)
# p CCC.new.single_method_hi # undefined method `single_method_hi' for #<CCC:0x00000000050db0d8> (NoMethodError)