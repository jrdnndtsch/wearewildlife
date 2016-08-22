class AddFrTitleToTitles < ActiveRecord::Migration
  def change
    add_column :titles, :fr_title, :string
  end
end
