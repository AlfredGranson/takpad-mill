class CreateBlocks < ActiveRecord::Migration[7.0]
  def change
    create_table :blocks do |t|
      t.integer :page_id
      t.string :type
      t.string :body

      t.timestamps
    end
  end
end
