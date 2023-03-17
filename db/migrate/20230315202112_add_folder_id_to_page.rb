class AddFolderIdToPage < ActiveRecord::Migration[7.0]
  def change
    add_column :pages, :folder_id, :integer
  end
end
