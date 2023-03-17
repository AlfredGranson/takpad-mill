class AddBlockOrderToPages < ActiveRecord::Migration[7.0]
  def change
    add_column :pages, :block_order, :string
  end
end
