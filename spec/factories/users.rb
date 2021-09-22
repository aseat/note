FactoryBot.define do
  factory :user do
    creator              {"tarou"}
    noteid                 {"_mm"}
    password              {"12345678@c"}
    encrypted_password    {"12345678@c"}
    email           {"sample@gmail.com"}
  end
end