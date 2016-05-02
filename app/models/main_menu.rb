class MainMenu < ActiveRecord::Base
	has_many :sub_menus
	has_paper_trail
end
