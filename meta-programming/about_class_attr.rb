# class Ticket
#   def price
#     @price
#   end
#
#   def set_price(amount)
#     @price = amount
#   end
# end
#
# ticket1 = Ticket.new
# ticket1.set_price 52.00
# p ticket1.price


# setter 方法
# 以上是自定义方法设置属性，一般格式为set_[属性名]


# class Ticket
#   def price
#     @price
#   end
#
#   def price=(amount)
#     @price = amount
#   end
# end
# ticket2 = Ticket.new
# ticket2.price= 12.00
# p ticket2.price

# setter 方法
# 以上是方法名中的等号，也可用于做控制器和过滤器

# class Ticket
#   def price
#     @price
#   end
#
#   def price=(amount)
#     if (amount * 100).to_i === amount * 100
#       @price = amount
#     else
#       puts 'not number'
#     end
#   end
# end
# ticket3 = Ticket.new
# ticket3.price = 12.00
# p ticket3.price
# ticket3.price = '45'
# p ticket3.price

class Ticket
  attr_reader :date
  attr_accessor :price
  def initialize(date)
    @date = date
  end
  def detail
    puts "this price is #{@price}, this date is #{@date}"
  end
end

ticket4 = Ticket.new('05/03/20')
p ticket4.date
ticket4.price = 1.00
p ticket4.price
p ticket4.detail

# attr_* 方法
# 默认接收者self，attr_accessor创建读取和写入属性

