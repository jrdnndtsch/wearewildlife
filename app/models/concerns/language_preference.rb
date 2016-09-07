module LanguagePreference


	def header_lang(user)
		user.preferred_language == 'en' ? 'Header' : 'Fr Header'
	end

	def blog_lang(user)
		user.preferred_language == 'en' ? 'Blog' : 'Blogue'
	end

	def title_used(user, element)
		user.preferred_language == 'en' ? element.title : element.fr_title
	end

	def editing_lang(user)
		user.preferred_language == 'en' ? 'Editing' : 'Fr Editing'
	end

	def number_lang(user)
		user.preferred_language == 'en' ? 'Number' : 'Fr Number'
	end

	def update_lang(user)
		user.preferred_language == 'en' ? 'Update' : 'Fr Update'
	end

	def new_lang(user)
		user.preferred_language == 'en' ? 'New' : 'Nouveau'
	end

	def yes_lang(user)
		user.preferred_language == 'en' ? 'Yes' : 'Oui'
	end

	def no_lang(user)
		user.preferred_language == 'en' ? 'No' : 'Non'
	end

	def back_lang(user)
		user.preferred_language == 'en' ? 'Back' : 'Fr Back'	
	end

	def delete_lang(user)
		user.preferred_language == 'en' ? 'Delete' : 'Fr Delete'	
	end

	def remove_lang(user)
		user.preferred_language == 'en' ? 'Remove' : 'Fr Remove'	
	end

end