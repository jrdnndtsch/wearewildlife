class SubMenu < ActiveRecord::Base
  belongs_to :main_menu
  has_paper_trail
end
