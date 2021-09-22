require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録できる' do
    it '全部入力すれば登録できること' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end

    it 'creatorがあれば登録できること' do
      user = FactoryBot.build(:user)
      user.creator = '渋谷'
      expect(user).to be_valid
    end

    it 'noteidがあれば登録できること' do
      user = FactoryBot.build(:user)
      user.noteid = 'mm_'
      expect(user).to be_valid
    end

    it 'emailがあれば登録できること' do
      user = FactoryBot.build(:user)
      user.email = 'miki@gmail.com'
      expect(user).to be_valid
    end

    it 'passwordがあれば登録できること' do
      user = FactoryBot.build(:user)
      user.password = "aaaaaaaa876"
      user.password_confirmation = "aaaaaaaa876"
      expect(user).to be_valid
    end
  end
  describe 'ユーザー新規登録できない' do
    it 'creatorが空では登録できない' do
      user = FactoryBot.build(:user)  
      user.creator = ''  
      user.valid?
      expect(user.errors.full_messages).to include("クリエイター名を入力してください")
    end

    it 'noteidが空では登録できない' do
      user = FactoryBot.build(:user)  
      user.noteid = ''  
      user.valid?
      expect(user.errors.full_messages).to include("note IDを入力してください", "note IDは3文字以上〜16文字以内で入力してください。")
    end

    it 'noteidが3文字未満では登録できない' do
      user = FactoryBot.build(:user)  
      user.noteid = 's'  
      user.valid?
      expect(user.errors.full_messages).to include("note IDは3文字以上〜16文字以内で入力してください。")
    end

    it 'noteidが17文字以上では登録できない' do
      user = FactoryBot.build(:user)  
      user.noteid = '12345678901234567890'  
      user.valid?
      expect(user.errors.full_messages).to include("note IDは3文字以上〜16文字以内で入力してください。")
    end

    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)  
      user.email = ''  
      user.valid?
      expect(user.errors.full_messages).to include("メールアドレスを入力してください")
    end

    it 'passwordが空では登録できない' do
      user = FactoryBot.build(:user)  
      user.password = ''  
      user.valid?
      expect(user.errors.full_messages).to include("パスワードを入力してください")
    end

    it 'passwordが6文字未満では登録できない' do
      user = FactoryBot.build(:user)  
      user.password = 11  
      user.valid?
      expect(user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは6文字以上で入力してください", "パスワードは半角英数記号で入力してください。")
    end

    it 'passwordが数字では登録できない' do
      user = FactoryBot.build(:user)  
      user.password = 111111111  
      user.valid?
      expect(user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは半角英数記号で入力してください。")
    end

    it 'passwordが英字では登録できない' do
      user = FactoryBot.build(:user)  
      user.password = "aaaaaaaa" 
      user.valid?
      expect(user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは半角英数記号で入力してください。")
    end

    it 'passwordが一致しないと登録できない' do
      user = FactoryBot.build(:user)  
      user.password = "aaaaaaaa876"
      user.password_confirmation = 'aaaaaa' 
      user.valid?
      expect(user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
  end
end