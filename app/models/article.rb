class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  has_many      :tags, dependent: :destroy
  has_many      :article_bodies, dependent: :destroy
  has_one :order, dependent: :destroy
  accepts_nested_attributes_for :tags,:article_bodies, allow_destroy: true
  with_options presence: true do
    validates :title, length: { maximum: 50 }
  end
end
