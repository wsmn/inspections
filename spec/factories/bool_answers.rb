FactoryGirl.define do
  factory :bool_answer do
    answer { [true, false].sample }
  end
end
