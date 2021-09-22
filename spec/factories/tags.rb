FactoryBot.define do
  factory :tag do
    text {'mfdagag'}
    article_id {FactoryBot.create(:article).id}
  end
end
