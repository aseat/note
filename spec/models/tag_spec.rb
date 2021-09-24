require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe '登録できる' do
    it '全部あれば登録できること' do
      tag = FactoryBot.build(:tag)
      expect(tag).to be_valid
    end
  end
  describe '登録できない' do
    it 'textが空だと登録できない' do
      tag = FactoryBot.build(:tag)  
      tag.text = ''  
      tag.valid?
      expect(tag.errors.full_messages).to include()
  end
 end 
end 