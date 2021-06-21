class AddPriceToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :price, :integer
  end
end
