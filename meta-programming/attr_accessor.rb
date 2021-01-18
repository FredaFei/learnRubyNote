class A
  def self.custom_accessor(*names)
    names.each do |name|
      define_method(name) do
        instance_variable_get(:"@#{name}")
      end
      define_method("#{name}=") do |value|
        instance_variable_set(:"@#{name}", value)
      end
    end
  end
  
  custom_accessor :name, :habit
  p 'A'
  p self
  # 如下代码中的 @ vs self 等价
  def initialize(name, habit)
    p 'init'
    p self
    self.name = name
    self.habit = habit
  end
  
  # def inspect
  #   "#<A @name=\"#{@name}\" @habit=\"#{@habit}\">"
  # end
end

p A.new 'ha', 'sleep'