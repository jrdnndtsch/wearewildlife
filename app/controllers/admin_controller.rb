class AdminController < ApplicationController
	layout 'admin'
  def show
  	add_breadcrumb "Admin", "#"
  end
end
