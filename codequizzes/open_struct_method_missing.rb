class MyOpenStruct
  private
  def method_missing(name, *args)
    iv = "@#{name.to_s}"
    if name[-1] == '='
      instance_variable_set(iv.chop, args.first)
    else
      instance_variable_get(iv)
    end
  end
end

c = MyOpenStruct.new
c.bob = 'lob'
p c.bob # => 'lob'
p c.phil # => nil
c.phil = 'phhhhhil'
p c.phil # => 'phhhhhil'
p c.instance_variables # => [:@bob, :@phil]


# 接下来看 dsl.rb