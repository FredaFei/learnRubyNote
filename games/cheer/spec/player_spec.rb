require 'spec_helper'
module Cheer
  describe Player do
    context "初始化" do
      # it "设置初始值失败" do
      #   options = {}
      #   expect(Player.new options).to eq raise_error
      # end
      it "设置初始值" do
        options = {color: 'red', name: 'A'}
        player = Player.new options
        expect(player.color).to eq options[:color]
        expect(player.name).to eq options[:name]
      end
    end
  end
end