class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  with_options presence: true do
    validates :title, length: { maximum: 50 }
    validates :text
  end
end