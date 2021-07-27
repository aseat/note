class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         with_options presence: true do
          validates :creator
          validates :noteid, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: 'Include both letters and numbers' }
          validates :encrypted_password, :password, length: { minimum: 8 }, format: { with: /\A[\w@-]*[A-Za-z][:-@¥[-`{-~]+$]*\z/ , message: 'Include both letters and numbers' }
        end
end
