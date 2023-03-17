FactoryBot.define do
  factory :block do
    association :page

    type { "Blocks::Text" }
    body { "MyString" }
  end
end
