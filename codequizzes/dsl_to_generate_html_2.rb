class HtmlDsl
  attr_reader :result
  
  def initialize(&block)
    instance_eval(&block)
  end
  
  private
  
  def method_missing(name, *args, &block)
    tag = name.to_s
    content = args.first
    @result ||= ''
    @result << "<#{tag}>"
    if block_given?
      instance_eval(&block)
    else @result << content
    end
    @result << "</#{tag}>"
  end
end

html = HtmlDsl.new do
  html do
    head do
      title 'title'
    end
    body do
      h1 "body"
    end
  end
end
p html.result #<html><head><title>title</title></head><body><h1>body</h1></body></html>
#接下来看 instance_eval_method.rb