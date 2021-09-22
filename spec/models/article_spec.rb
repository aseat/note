require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '登録できる' do
    it '全部あれば登録できること' do
      article = FactoryBot.build(:article)
      expect(article).to be_valid
    end
  end
  describe '登録できない' do
    it 'bodyが空だと登録できない' do
      article = FactoryBot.build(:article)  
      article.title = ''  
      article.valid?
      expect(article.errors.full_messages).to include("タイトルを入力してください")
  end
 end
end
