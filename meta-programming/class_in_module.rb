module A
  class C1
    def say_yes
      p 'C1 yes'
    end
  end
  
  class C2
    def say_no
      p 'C2 no'
    end
    
    def game_over
      # :x 是一个symbol，表示x?
      return :x if x?
      false
    end
    
    private
    
    def x?
      p 111
      2 % 2 == 0
    end
  end
  
  class Run
    attr_accessor :name, :c2
    
    def initialize(a, c2 = C2.new)
      # @ 表示类的实例变量
      @name = a
      @c2 = c2
    end
    
    def play
      c2.say_no
    end
    
    def flag
      p c2.game_over == :x
    end
  end
end
# 模块编写
a = A::Run.new('a').c2.send :x?
p a
A::Run.new('a').c2.say_no
A::Run.new('a').play
A::Run.new('a').flag
# 接下来请看 attr_accessor.rb