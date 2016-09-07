class AddDefaultToLanguage < ActiveRecord::Migration
  def change
  	change_column :users, :preferred_language, :string, :default => 'en'
  end
end
