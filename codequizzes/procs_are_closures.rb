class Doug
  p self # => Doug
  x = 'tv show'
  best_friend = 'skeeter'
  p local_variables # => [:x, :best_friend]
  @pr = Proc.new { "self: #{self}, local_variables: #{local_variables}" }
  @pr.call # => "self: Doug, local_variables: [:x, :best_friend]"
end

px = Proc.new do
  x = 25
  y = 33
  "self: #{self}, local_variables: #{local_variables}"
end

class Bear
  def initialize(pr)
    # the program's scope has changed since the proc was defined
    # but the proc still has access to the same lexical environment
    # that existed when it was defined
    p pr.call
  end
end

Bear.new(px) # => "self: main, local_variables: [:x, :y, :px]"
# 接下来看 block_scope.rb