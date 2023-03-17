class Page < ApplicationRecord
	belongs_to :folder
  has_many :blocks
end
