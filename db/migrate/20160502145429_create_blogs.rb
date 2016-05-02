class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :author
      t.date :date
      t.text :short_description
      t.string :link
      t.string :video_link

      t.timestamps null: false
    end
  end
end
