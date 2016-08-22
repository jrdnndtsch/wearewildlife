class CreateFrTweets < ActiveRecord::Migration
  def change
    create_table :fr_tweets do |t|
      t.string :text

      t.timestamps null: false
    end
  end
end
