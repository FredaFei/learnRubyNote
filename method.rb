def doubleNum n
  puts 'hello ... '*n
end
doubleNum 2

def doubleThis n
  newNum = n*3
  puts 'newNum='+newNum.to_s + '; n='+ n.to_s
end
doubleThis 9

def localVar var
  var = 'new bar2'
  returnValue = puts 'haha, new var '+var.to_s
  puts returnValue
  'lala'
end
var = 'glo'
xx = localVar 2
puts var
puts xx


def ask question
  goodAnswer = false
  while (not goodAnswer)
    puts question
    reply = gets.chomp.downcase

    if (reply == 'yes' or reply == 'no')
      goodAnswer = true
      if reply == 'yes'
        answer = true
      else
        answer = false
      end
    else
      puts 'Please answer "yes" or "no".'
    end
  end
  # answer
end

puts 'Hello, and thank you for...'
puts

ask 'Do you like eating tacos?'      
ask 'Do you like eating burritos?'
wetsBed = ask 'Do you wet the bed?'
ask 'Do you like eating chimichangas?'
ask 'Do you like eating sopapillas?'
ask 'Do you like eating tamales?'
puts 'Just a few more questions...'
ask 'Do you like drinking horchata?'
ask 'Do you like eating flautas?'

puts
puts 'DEBRIEFING:'
puts 'Thank you for...'
puts
puts wetsBed