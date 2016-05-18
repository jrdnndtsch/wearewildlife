class AddSelectedToGenericStory < ActiveRecord::Migration
  def change
    add_column :generic_stories, :selected, :boolean, default: false
  end
end
