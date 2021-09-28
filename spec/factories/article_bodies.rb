FactoryBot.define do
  factory :article_body do
    body {'mfdagag'}
    article_id {FactoryBot.create(:article).id}
  end
end