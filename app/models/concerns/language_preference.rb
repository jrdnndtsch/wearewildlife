module LanguagePreference

	# Translation for Models
	def header_lang(user)
		user.preferred_language == 'en' ? 'Header' : 'Entête'
	end

	def calls_to_action_lang(user)
		user.preferred_language == 'en' ? 'Calls to Action' : 'Fr Calls to Action'
	end

	def generic_stories_lang(user)
		user.preferred_language == 'en' ? 'Generic Stories' : 'Fr Generic Stories'
	end

	def menu_lang(user)
		user.preferred_language == 'en' ? 'Menu' : 'Le Menu'
	end

	def featured_member_lang(user)
		user.preferred_language == 'en' ? 'Featured Member' : 'Membre en Vedette'
	end

	def blog_lang(user)
		user.preferred_language == 'en' ? 'Blog' : 'Blogue'
	end

	def title_used(user, element)
		user.preferred_language == 'en' ? element.title : element.fr_title
	end

	# Generic Language translation

	def admin_lang(user)
		user.preferred_language == 'en' ? 'WWF Admin' : "WWF Panneau d'Administration"	
	end

	def update_profile_lang(user)
		user.preferred_language == 'en' ? 'Update My Profile' : "Fr Update My Profile"	
	end

	def logged_in_lang(user)
		user.preferred_language == 'en' ? 'Logged in as' : 'Fr logged in as'	
	end

	def logout_lang(user)
		user.preferred_language == 'en' ? 'Logout' : 'Fr logout'	
	end

	def recent_updates_lang(user)
		user.preferred_language == 'en' ? 'Recent Updates' : 'Fr Recent Updates'	
	end

	def all_lang(user)
		user.preferred_language == 'en' ? 'All' : 'Tous'
	end
	def title_lang(user)
		user.preferred_language == 'en' ? 'Title' : 'Titre'
	end

	def featured_lang(user)
		user.preferred_language == 'en' ? 'Featured' : 'Fr Featured'
	end

	def selected_lang(user)
		user.preferred_language == 'en' ? 'Selected' : 'Choisi'
	end

	def approved_lang(user)
		user.preferred_language == 'en' ? 'Approved?' : 'A Approuvé?'
	end

	def date_lang(user)
		user.preferred_language == 'en' ? 'Date' : 'Date'
	end

	def editing_lang(user)
		user.preferred_language == 'en' ? 'Editing' : 'Fr Editing'
	end

	def edit_lang(user)
		user.preferred_language == 'en' ? 'Edit' : 'Modifier'
	end

	def number_lang(user)
		user.preferred_language == 'en' ? 'Number' : 'Nombre'
	end

	def update_lang(user)
		user.preferred_language == 'en' ? 'Update' : 'Réactualiser'
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
		user.preferred_language == 'en' ? 'Back' : 'Reculer'	
	end

	def delete_lang(user)
		user.preferred_language == 'en' ? 'Delete' : 'Effacer'	
	end

	def remove_lang(user)
		user.preferred_language == 'en' ? 'Remove' : 'éliminer'	
	end

end