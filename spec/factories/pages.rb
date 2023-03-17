FactoryBot.define do
  factory :page do
    association :folder

    title { "MyString" }
  end
end
