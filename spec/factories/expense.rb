FactoryGirl.define do
  factory :expense do
    sequence(:name) {|n| "Name #{n}" }
    sequence(:weight) {|n| n }
  end
end
