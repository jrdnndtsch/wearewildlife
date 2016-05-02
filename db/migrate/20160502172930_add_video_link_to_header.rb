class AddVideoLinkToHeader < ActiveRecord::Migration
  def change
    add_column :headers, :video_link, :string
  end
end
