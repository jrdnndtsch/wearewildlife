class CreateHeaders < ActiveRecord::Migration
  def change
    create_table :headers do |t|
      t.integer :number
      t.string :tag_line
      t.text :about

      t.timestamps null: false
    end
  end
end
