class PageResource < ApplicationResource
  attribute :title, :string
  attribute :created_at, :datetime
  attribute :block_order, :string

  attribute :folder_id, :integer

  belongs_to :folder
  has_many :blocks
end
