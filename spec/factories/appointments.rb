FactoryBot.define do
  factory :appointment do
    appointment_date Time.now
    duration 1
    price 200
    association :client
  end
end
