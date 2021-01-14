# frozen_string_literal: true
require_relative "cheer/version"
module Cheer
  class Error < StandardError; end
  
  # Your code goes here...
end
# require_relative 'cheer/cell'
# require_relative 'cheer/player'
# require_relative 'cheer/board'
# require_relative 'cheer/core_extensions'
require_relative "./cheer/core_extensions.rb"
lib_path = File.expand_path(File.dirname(__FILE__))
Dir[lib_path + "/cheer/**/*.rb"].each { |file| require file }

