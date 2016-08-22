class CreateFrBlogs < ActiveRecord::Migration
  def change
    create_table :fr_blogs do |t|
      t.string :title
      t.string :author
      t.date :date
      t.text :short_description
      t.string :link
      t.string :video_link
      t.boolean :approved, default: false
      t.string :image_url
      t.integer :wp_id
      t.string :photo_by

      t.timestamps null: false
    end
  end
end
