class Car
  @@makes = []
  @@cars = {}
  @@total_count = 0

  attr_reader :make

  def self.add_make(make)
    unless @@makes.include?(make)
      @@makes << make
      @@cars[make] = 0
    end
  end

  def self.total_count
    @@total_count
  end

  def self.all_makes
    @@makes
  end

  def initialize(make)
    if @@makes.include?(make)
      p "create a new #{make} "
      @make = make
      @@cars[make] += 1
      @@total_count += 1
    else
      p "no such make: #{make}"
    end
  end

  def make_mates
    p "make_mates #{self}"
    @@cars[self.make]
  end
end

# 创建品牌
Car.add_make('Honda')
Car.add_make('Ford')

# 批量生产该品牌
h = Car.new('Honda')
f = Car.new('Ford')
h2 = Car.new('Honda')

p "total car makes  #{Car.all_makes}"
p "total count h2  #{h2.make_mates}"
p "total count  #{Car.total_count}"

Car.new('XYZ')


# 变量共享过多，子类与父类方法或属性重复时，无法自定义
# 使用类对象的实例变量维护每个对象的状态
# 请看 class_var_scope2.rb

