class AddColumnsToSubMenus < ActiveRecord::Migration
  def change
  	add_column :sub_menus, :fr_title, :string
  	add_column :sub_menus, :fr_link, :string
  	add_column :sub_menus, :fr_description, :string
  end
end
