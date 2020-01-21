class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.string :image
      t.string :name
      t.integer :price
      t.text :commitment
      t.text :allergy

      t.timestamps
    end
  end
end
