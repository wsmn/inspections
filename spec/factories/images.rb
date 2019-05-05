FactoryBot.define do
  factory :image do
    project
    file { generate(:image_file) }
    description
    taken_at { Time.current }
  end
end
