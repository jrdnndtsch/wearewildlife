class CreateFrGrams < ActiveRecord::Migration
  def change
    create_table :fr_grams do |t|
      t.string :image_url
      t.string :text

      t.timestamps null: false
    end
  end
end
