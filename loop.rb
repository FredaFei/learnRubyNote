n = 0
while n<15
  puts 'hai' * n
  n = n+1
end

names = ['freda','marry','lily']
names.empty?
[].empty?
while !names.empty?
  puts "#{names.shift} leaves this party"
end

nil.nil?
false.nil?
[].nil?
''.nil?

$fibs = [1,2]
def fibFn(index)
  while $fibs[index].nil?
    $fibs<<$fibs[-1] + $fibs[-2]
  end
  $fibs[index]
end

square = lambda {|n| n*n}
square.call(8)
(3..9).collect(&square)

from100 = lambda{|n|100-n}
monkeys = lambda{|n| "Monkey" *n}
procs = [square,from100,monkeys]
