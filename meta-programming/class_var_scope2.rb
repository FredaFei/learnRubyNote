
class Car
  @@makes = []
  @@cars = {}
  attr_reader :make

  def self.add_make(make)
    unless @@makes.include?(make)
      @@makes << make
      @@cars[make] = 0
    end
  end

  def self.total_count
    @total_count ||= 0
  end

  def self.total_count=(amount)
    @total_count = amount
  end

  def self.all_makes
    @@makes
  end

  def initialize(make)
    if @@makes.include?(make)
      p "create a new #{make} "
      @make = make
      @@cars[make] += 1

      self.class.total_count += 1
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

class Hybrid < Car

end

hy = Hybrid.new('Honda')
p "Hybrid total count"
p Hybrid.total_count