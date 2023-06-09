class BlockResource < ApplicationResource
  attribute :type, :string_enum, allow: ['text']
  attribute :body, :string

  attribute :page_id, :integer

  belongs_to :page
end
