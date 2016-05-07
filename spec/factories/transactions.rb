FactoryGirl.define do
  factory :transaction do
    amount Faker::Number.between(75, 275)
    amount_type "0"
    user
    tag
  end

  factory :income, class: Transaction do
    amount Faker::Number.between(200, 400)
    amount_type "1"
    user
    tag
  end
end
