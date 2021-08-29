class Article < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many      :tags, dependent: :destroy

  accepts_nested_attributes_for :tags, allow_destroy: true, reject_if: :all_blank
  with_options presence: true do
    validates :title, length: { maximum: 50 }
  end
end
