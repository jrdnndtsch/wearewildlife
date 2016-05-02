class CreateSubMenus < ActiveRecord::Migration
  def change
    create_table :sub_menus do |t|
      t.string :title
      t.string :link
      t.references :main_menu, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
