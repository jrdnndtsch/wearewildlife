class AddApprovedToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :approved, :boolean, default: false
  end
end
