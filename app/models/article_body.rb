class ArticleBody < ApplicationRecord
  belongs_to :article
  has_many_attached :images
  mount_uploader :image, ImageUploader
  validates :body, presence: true
end