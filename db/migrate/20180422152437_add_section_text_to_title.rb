class AddSectionTextToTitle < ActiveRecord::Migration
  def change
    add_column :titles, :section_text, :text
    add_column :titles, :fr_section_text, :text
  end
end
