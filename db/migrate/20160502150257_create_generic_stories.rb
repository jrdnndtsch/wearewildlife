class CreateGenericStories < ActiveRecord::Migration
  def change
    create_table :generic_stories do |t|
      t.string :title
      t.text :short_description
      t.string :link

      t.timestamps null: false
    end
  end
end
