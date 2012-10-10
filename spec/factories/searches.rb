# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :search do
    participant_id 1
    confidence_discrete 1
    answer_discrete "MyText"
    confidencewhy_discrete "MyText"
  end
end
