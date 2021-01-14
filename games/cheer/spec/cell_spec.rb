require 'spec_helper'
module Cheer
  describe Cell do
    context "初始化" do
      it "默认值为 ''" do
        cell = Cell.new
        expect(cell.value).to eq ''
      end
      it "设置初始值" do
        cell = Cell.new 123
        expect(cell.value).to eq 123
      end
    end
  end
end