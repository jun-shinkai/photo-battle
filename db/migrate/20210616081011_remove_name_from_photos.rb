class RemoveNameFromPhotos < ActiveRecord::Migration[6.0]
  def change
    remove_column :photos, :name, :string
    remove_column :photos, :category_id , :integer
    remove_column :photos, :cate_id, :integer
  end
end
