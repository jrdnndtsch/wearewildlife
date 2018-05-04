class AddOrderToSubMenu < ActiveRecord::Migration
  def change
    add_column :sub_menus, :order, :integer
  end
end
