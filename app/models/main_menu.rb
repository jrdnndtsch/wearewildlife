class MainMenu < ActiveRecord::Base
	has_many :sub_menus
	accepts_nested_attributes_for :sub_menus, allow_destroy: true
	
	include LanguagePreference
	
	has_paper_trail
end
