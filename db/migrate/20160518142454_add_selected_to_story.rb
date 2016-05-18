class AddSelectedToStory < ActiveRecord::Migration
  def change
    add_column :stories, :selected, :boolean, default: false
  end
end
