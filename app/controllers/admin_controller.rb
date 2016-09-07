class AdminController < ApplicationController
	layout 'admin'
  def show
  	# @header = Header.first
  	add_breadcrumb "Admin", "#"
  	@header = Header.first
  end
end
