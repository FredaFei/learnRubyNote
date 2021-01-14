require_relative "../lib/cheer.rb"
puts "Welcome to cheer"
bob = Cheer::Player.new({color: "X", name: "bob"})
frank = Cheer::Player.new({color: "O", name: "frank"})
players = [bob, frank]
Cheer::Game.new(players).play