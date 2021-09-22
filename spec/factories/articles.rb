FactoryBot.define do
  factory :article do
    title {'adfgs'}
    buyer_id {1}
    user_id {FactoryBot.create(:user).id}
  end
end
