require 'spec_helper'
describe Array do
  context 'all_empty' do
    it 'all_empty true' do
      expect(['', '', ''].all_empty?).to eq true
    end
    it 'all_empty false' do
      expect(['1', '', :x].all_empty?).to eq false
    end
    it 'all_empty true []' do
      expect([].all_empty?).to eq true
    end
  end
  context 'all_same?' do
    it 'all_same? true' do
      expect(['a', 'a', 'a'].all_same?).to eq true
    end
    it 'all_same? false' do
      expect(['1', '', :x].all_same?).to eq false
    end
    it 'all_same? true []' do
      expect([].all_same?).to eq true
    end
  end
end