class CreateMainMenus < ActiveRecord::Migration
  def change
    create_table :main_menus do |t|
      t.string :title
      t.string :link

      t.timestamps null: false
    end
  end
end
