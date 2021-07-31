class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         with_options presence: true do
          validates :creator
          validates :noteid, format: { with: /\A[a-zA-Z0-9_]{3,16}\z/, message: 'は3文字以上〜16文字以内で入力してください。' }
          validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d[!-\/:-@\[-`{-~\d])[!-~\d]{8,}+\z/, message: 'は8文字以上で入力してください。', message: 'は半角英数記号で入力してください。'  }
        end
end
