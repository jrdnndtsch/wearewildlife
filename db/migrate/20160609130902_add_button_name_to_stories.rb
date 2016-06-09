class AddButtonNameToStories < ActiveRecord::Migration
  def change
    add_column :stories, :button_name, :string
  end
end
