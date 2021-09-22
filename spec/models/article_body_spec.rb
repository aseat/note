require 'rails_helper'

RSpec.describe ArticleBody, type: :model do
  describe '登録できる' do
    it '全部あれば登録できること' do
      article_body = FactoryBot.build(:article_body)
      expect(article_body).to be_valid
    end
  end
  describe '登録できない' do
    it 'bodyが空だと登録できない' do
      article_body = FactoryBot.build(:article_body)  
      article_body.body = ''  
      article_body.valid?
      expect(article_body.errors.full_messages).to include("Bodyを入力してください")
  end
 end
end
