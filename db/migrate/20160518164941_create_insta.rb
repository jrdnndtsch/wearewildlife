class CreateInsta < ActiveRecord::Migration
  def change
    create_table :insta do |t|
      t.string :imag_url
      t.string :text

      t.timestamps null: false
    end
  end
end
