FactoryGirl.define do
  factory :month do
    sequence(:name) {|n| "Name #{n}" }
    sequence(:result) {|n| "Result #{n}" }
  end
end
