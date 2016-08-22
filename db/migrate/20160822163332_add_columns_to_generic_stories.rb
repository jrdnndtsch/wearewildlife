class AddColumnsToGenericStories < ActiveRecord::Migration
  def change
  	add_column :generic_stories, :fr_title, :string
  	add_column :generic_stories, :fr_short_description, :text
  	add_column :generic_stories, :fr_link, :string
  	add_column :generic_stories, :fr_button_name, :string
  end
end
