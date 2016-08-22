class AddColumnsToStories < ActiveRecord::Migration
  def change
  	add_column :stories, :fr_title, :string
  	add_column :stories, :fr_location, :string
  	add_column :stories, :fr_link, :string
  	add_column :stories, :fr_description, :text
  	add_column :stories, :fr_button_name, :string
  	add_column :stories, :fr_photo_by, :string
  end
end
