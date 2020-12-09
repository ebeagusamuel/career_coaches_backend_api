FactoryBot.define do
  factory :coach do
    name { Faker::Name.name }
    location { Faker::Address.full_address }
    charge_per_hour { '$50' }
    phone_number { Faker::PhoneNumber.cell_phone_with_country_code }
    qualification { 'Certified Career Management Coach' }
  end
end
