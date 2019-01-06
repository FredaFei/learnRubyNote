def greet
  # puts 'welcome methods'
  return 'nice to meet you'
end
name = greet
puts 'name'
puts name

def sayHi(some='haha')
  # 皆有变量的均为双引号
  puts "welcome methods, #{some}"
  return 'nice to meet you'
end
sayHi
sayHi('Freda')
sayHi 'Marry'
