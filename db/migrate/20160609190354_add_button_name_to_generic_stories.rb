class AddButtonNameToGenericStories < ActiveRecord::Migration
  def change
    add_column :generic_stories, :button_name, :string
  end
end
