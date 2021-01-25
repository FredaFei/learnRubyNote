class Object
  def self.readers(*args)
    args.each do |arg|
      define_method(arg) {
        instance_variable_get("@#{arg.to_s}")
      }
    end
  end
end

class Person
  readers(:first_name, :last_name)
  
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end
end

b = Person.new('b', [1,5])
p b.first_name # => 'b'
p b.last_name # => 'l'
# 接下来看 extend_and_include.rb
