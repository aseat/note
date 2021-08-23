class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :tags, dependent: :destroy
  accepts_nested_attributes_for :tags, allow_destroy: true
  with_options presence: true do
    validates :title, length: { maximum: 50 }
    validates :body
  end
end
