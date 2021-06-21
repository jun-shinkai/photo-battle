class AddColumnsToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_column  :photos,:category_id, :integer, null: false, default: ''
    add_column  :photos,:sales_status_id , :integer,  null: false, default: ''
    add_column  :photos,:shipping_fee_status_id  , :integer,  null: false, default: ''
    add_column  :photos,:prefecture_id  , :integer,  null: false, default: ''
    add_column  :photos,:scheduled_delivery_id  , :integer,  null: false, default: ''
  end
end
