class AddColumnsToMainMenus < ActiveRecord::Migration
  def change
  	add_column :main_menus, :fr_title, :string
  	add_column :main_menus, :fr_link, :string
  end
end
