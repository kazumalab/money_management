FactoryGirl.define do
  factory :money do
    price 100
    saved_at Time.zone.now
    trait :with_user do
      user create(:user)
    end
  end
end