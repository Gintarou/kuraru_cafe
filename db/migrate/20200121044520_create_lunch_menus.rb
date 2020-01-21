class CreateLunchMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :lunch_menus do |t|
      t.string :name
      t.string :price
      t.string :allergy
      t.text :commitment

      t.timestamps
    end
  end
end
