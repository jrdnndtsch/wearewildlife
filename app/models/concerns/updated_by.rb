module UpdatedBy
	def model_updated_by_user(model)
		update_list = []
		Struct.new("Update", :user, :time)
		model.versions.each do |update|
			user_id = update.whodunnit
			if User.where(id: user_id).present?
				time = update.created_at
				user = User.find(user_id)
				update_list.push(Struct::Update.new(user, time))
			end
		end
		return update_list
	end
end 	