class AddDescriptionToSubMenus < ActiveRecord::Migration
  def change
    add_column :sub_menus, :description, :string
  end
end
