class AddDeleteAtToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :delete_at, :datatime
    add_index :products, :delete_at
  end
end
