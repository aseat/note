class ArticleBody < ApplicationRecord
  belongs_to :article
  validates :body, presence: true
end
