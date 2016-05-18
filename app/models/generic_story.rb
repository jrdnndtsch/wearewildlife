class GenericStory < ActiveRecord::Base
	has_paper_trail

	scope :are_selected, -> { where(selected: true)}
end
