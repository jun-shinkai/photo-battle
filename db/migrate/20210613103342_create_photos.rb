class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string                 :name,         null: false, default: ""
      t.string                 :info,         null: false, default: ""
      t.references             :user,               foreign_key:true
    end
  end
end
