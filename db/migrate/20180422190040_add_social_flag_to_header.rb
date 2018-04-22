class AddSocialFlagToHeader < ActiveRecord::Migration
  def change
    add_column :headers, :show_social, :boolean, default: true
    add_column :headers, :fr_show_social, :boolean, default: true
  end
end
