class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.string :title
      t.string :section_name

      t.timestamps null: false
    end
  end
end
