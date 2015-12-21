class CreateProduct < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.float :price
      t.string :category


      t.timestamps
    end
  end
end
