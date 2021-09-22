FactoryBot.define do
  factory :user do
    creator              {'test'}
    noteid                {'mm_'}
    email                 {'test@example'}
    password              {'00000000@m'}
    password_confirmation {password}
  end
end
