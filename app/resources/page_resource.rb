class PageResource < ApplicationResource
  attribute :title, :string
  attribute :created_at, :datetime

  belongs_to :folder
end
