# top level scope
p self
x = 1

def hi # begin method scope
  x
end # end method scope

# back in top level scope
p x
# p hi # error

# top level scope
class A # begin class scope
  y = 99
  p y # => 99
  
  def self.hey # begin method scope
    y # => error because y is no longer in scope
  end # end method scope
  
  # back in class scope
  p y # => 99 (local variables are accessible again)
end # end class scope
# back in top level scope
# A.hey

# top level scope
p self # => main
# instance variable
@hero = 'ha' # @hero is bound to main object

def hero # begin method scope
  p self # => main
  @hero # accessible because implicit self is the main object
end # end method scope
# back in top level scope
p hero

module M # begin module scope
  def ok_setter # begin method scope
    @ok = 'ok, alright'
  end # end method scope
end # end module scope

class C # begin class scope
  include M
  def ok_reader # begin method scope
    # the module's instance methods are accessible
    ok_setter
    @ok
  end # end method scope
end # end class scope
p C.new.ok_reader

# top level scope
module Wrapper # begin Wrapper
  module Container # begin Container
    class A # begin A
      def hi # begin method
        'Wrapper::Container::A#hi'
      end # end method
    end # end A
  end # end Container
  
  class A # begin A
    def hi # begin method
      'Wrapper::A#hi'
    end # end method
  end # end A
end # end Wrapper
# end top level scope

p Wrapper::Container::A.new.hi
p Wrapper::A.new.hi

# 接下来看 procs_are_closures.rb