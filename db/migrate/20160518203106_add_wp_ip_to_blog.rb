class AddWpIpToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :wp_id, :integer
  end
end
