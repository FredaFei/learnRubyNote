module Cheer
  class Player
    attr_accessor :color, :name
    
    def initialize(options)
      @color = options.fetch(:color)
      @name = options.fetch(:name)
    end
  end
end