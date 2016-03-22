FactoryGirl.define do
  factory :transaction do
    amount Faker::Number.between(75, 275)
    amount_type "1"
    user
    tag
  end
end
