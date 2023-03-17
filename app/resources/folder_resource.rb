class FolderResource < ApplicationResource
  attribute :name, :string

  attribute :folder_id, :integer

  belongs_to :folder
  has_many :folders
  has_many :pages
end
