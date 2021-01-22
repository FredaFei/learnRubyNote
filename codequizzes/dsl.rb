a = []
a.instance_eval do
  push 1
  push 2
  reverse!
end
p a #[2,1]
def dsl(obj, &block)
  obj.instance_eval(&block)
end

b = []
dsl b do
  push 1
  push 2
  pop
  push 3
end
p b #[1,3]
Soup = Struct.new(:water, :salt)
s = Soup.new
dsl s do |soup|
  soup.water = 18
  soup.salt = false
end
p s
# 接下来看 dsl_to_generate_html_1.rb