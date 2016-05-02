class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :location
      t.date :date
      t.string :link
      t.text :description
      t.boolean :featured

      t.timestamps null: false
    end
  end
end
