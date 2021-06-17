class RemoveNameFromPhotos < ActiveRecord::Migration[6.0]
  def change
    remove_column :photos, :name, :string
  end
end
