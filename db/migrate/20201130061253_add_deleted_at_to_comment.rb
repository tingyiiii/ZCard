class AddDeletedAtToComment < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :deleted_at, :datetime, default: nil
    add_index :comments, :deleted_at #資料庫會使用binary tree方法搜尋
  end
end
