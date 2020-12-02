FactoryBot.define do
  factory :appointment do
    user
    coach
    date { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
  end
end