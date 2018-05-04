class AddOrderToMainMenu < ActiveRecord::Migration
  def change
    add_column :main_menus, :order, :integer
  end
end
