module UpdatedBy
	def model_updated_by_user(model)
		user_id = model.versions.last.whodunnit
		user = User.find(user_id)
	end
end 	