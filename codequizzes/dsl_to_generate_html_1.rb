class HtmlDsl
  attr_reader :result
  
  def initialize(&block)
    instance_eval(&block)
  end
  
  private
  
  def method_missing(name, *args)
    tag = name.to_s
    content = args.first
    @result ||= ''
    @result += "<#{tag}>#{content}</#{tag}>"
  end
end

html = HtmlDsl.new do
  h1 'title_haha'
  h2 "body_haha"
end
p html.result #<h1>title_haha</h1><h2>body_haha</h2>
# 接下来看 dsl_to_generate_html_2.rb