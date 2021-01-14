require 'spec_helper'
module Cheer
  describe Board do
    context "初始化" do
      it "设置初始值" do
        options = {grid: 'red'}
        expect { Board.new options }.to_not raise_error
      end
      it "默认设置的初始值" do
        board = Board.new
        expect(board.grid).to have(3).things
        board.grid.each do |row|
          expect(row).to have(3).things
        end
      end
      it "设置的初始值后grid的值为" do
        options = {grid: 'red'}
        board = Board.new options
        expect(board.grid).to eq options[:grid]
      end
    end
    context "get_cell" do
      it "get_cell grid的值为" do
        grid = [["", "", ""], ["", "", "a"], ["", "", ""]]
        board = Board.new(grid: grid)
        expect(board.get_cell(2, 1)).to eq "a"
      end
    end
    context "set_cell" do
      it "set_cell grid的值为" do
        Cat = Struct.new(:value)
        grid = [[Cat.new("cool"), "", ""], ["", "", ""], ["", "", ""]]
        board = Board.new(grid: grid)
        board.set_cell(0, 0, "meow")
        expect(board.get_cell(0, 0).value).to eq "meow"
      end
    end
    
    TestCell = Struct.new(:value)
    let(:x_cell) { TestCell.new("X") }
    let(:y_cell) { TestCell.new("Y") }
    let(:empty) { TestCell.new }
    
    context "game_over" do
      it "game_over winner is true" do
        board = Board.new
        board.stub(:winner?) { true }
        expect(board.game_over).to eq :winner
      end
      it "game_over winner is false and draw is true" do
        board = Board.new
        board.stub(:winner?) { false }
        board.stub(:draw?) { true }
        expect(board.game_over).to eq :draw
      end
      it "game_over winner is false and draw is false" do
        board = Board.new
        board.stub(:winner?) { false }
        board.stub(:draw?) { false }
        expect(board.game_over).to eq false
      end

      it "returns :winner when row has objects with values that are all the same" do
        grid = [
          [x_cell, x_cell, x_cell],
          [y_cell, x_cell, y_cell],
          [y_cell, y_cell, empty]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end

      it "returns :winner when colum has objects with values that are all the same" do
        grid = [
          [x_cell, x_cell, empty],
          [y_cell, x_cell, y_cell],
          [y_cell, x_cell, empty]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end

      it "returns :winner when diagonal has objects with values that are all the same" do
        grid = [
          [x_cell, empty, empty],
          [y_cell, x_cell, y_cell],
          [y_cell, x_cell, x_cell]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end

      it "returns :draw when all spaces on the board are taken" do
        grid = [
          [x_cell, y_cell, x_cell],
          [y_cell, x_cell, y_cell],
          [y_cell, x_cell, y_cell]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :draw
      end

      it "returns false when there is no winner or draw" do
        grid = [
          [x_cell, empty, empty],
          [y_cell, empty, empty],
          [y_cell, empty, empty]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq false
      end
    end
  end
end

