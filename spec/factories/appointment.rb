FactoryBot.define do
  factory :appointment do
    user_id
    coach_id
    date { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
  end
end
