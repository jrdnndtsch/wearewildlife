class GenericStory < ActiveRecord::Base
	
	include LanguagePreference
	
	has_paper_trail

	scope :are_selected, -> { where(selected: true)}
end
