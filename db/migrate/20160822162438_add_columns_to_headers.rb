class AddColumnsToHeaders < ActiveRecord::Migration
  def change
  	add_column :headers, :fr_tag_line, :string
  	add_column :headers, :fr_about, :text
  end
end
