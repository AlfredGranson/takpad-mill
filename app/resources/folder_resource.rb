class FolderResource < ApplicationResource
  attribute :name, :string

  attribute :folder_id, :integer, only: [:filterable]

  belongs_to :folder
end
