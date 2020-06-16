def to_words(s)
  s.gsub(/[^\da-zA-z\s]/, '')
end

# 请先在命令行运行 gem install test-unit 安装对应的库
require 'test/unit'

class ToWordsTest < Test::Unit::TestCase
  def test_1
    assert_equal '3 the Magic Number', to_words('#3, the *Magic, Number*?')
  end
end

# 如何你运行测试成功了，接下来请查看 words_of_string.rb

# 如果发现 RubyMine 右键运行出现 teamcity 字样
# 可以尝试将 C:\Program Files\JetBrains\RubyMine 2019.1.2\rb\testing\patch\testunit\test\unit\autorunner.rb
# 改名为 autorunner_x.rb，防止其运行
# p ENV 然后复制到编辑器中，搜索 autorun 可以找到此路径
# 如果没出现 teamcity 就不用改了
