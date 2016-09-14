module LanguagePreference

	# Translation for Models
	def header_lang(user)
		user.preferred_language == 'en' ? 'Header' : 'En-tête'
	end

	def calls_to_action_lang(user)
		user.preferred_language == 'en' ? 'Calls to Action' : 'Appels à l’action'
	end

	def generic_stories_lang(user)
		user.preferred_language == 'en' ? 'Generic Stories' : 'Histoires générales'
	end

	def menu_lang(user)
		user.preferred_language == 'en' ? 'Menu' : 'Menu'
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
		user.preferred_language == 'en' ? 'WWF Admin' : "Administrateur WWF"	
	end

	def update_profile_lang(user)
		user.preferred_language == 'en' ? 'Update My Profile' : "Mettre à jour mon profil"	
	end

	def logged_in_lang(user)
		user.preferred_language == 'en' ? 'Logged in as' : 'Connecté comme'	
	end

	def logout_lang(user)
		user.preferred_language == 'en' ? 'Logout' : 'Déconnexion'	
	end

	def recent_updates_lang(user)
		user.preferred_language == 'en' ? 'Recent Updates' : 'Récentes mises à jour'	
	end

	def all_lang(user)
		user.preferred_language == 'en' ? 'All' : 'Tout'
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
		user.preferred_language == 'en' ? 'Approved?' : 'Approuvé?'
	end

	def date_lang(user)
		user.preferred_language == 'en' ? 'Date' : 'Date'
	end

	def editing_lang(user)
		user.preferred_language == 'en' ? 'Editing' : 'Édition'
	end

	def edit_lang(user)
		user.preferred_language == 'en' ? 'Edit' : 'Corriger'
	end

	def number_lang(user)
		user.preferred_language == 'en' ? 'Number' : 'Nombre'
	end

	def update_lang(user)
		user.preferred_language == 'en' ? 'Update' : 'Mise à jour'
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
		user.preferred_language == 'en' ? 'Back' : 'Retour'	
	end

	def delete_lang(user)
		user.preferred_language == 'en' ? 'Delete' : 'Supprimer'	
	end

	def remove_lang(user)
		user.preferred_language == 'en' ? 'Remove' : 'Enlever'	
	end

	def author_lang(user)
		user.preferred_language == 'en' ? 'Author' : 'Auteur'	
	end

	def brief_description_lang(user)
		user.preferred_language == 'en' ? 'Brief Description' : 'Brève Déscription'	
	end

	def description_lang(user)
		user.preferred_language == 'en' ? 'Description' : 'Déscription'	
	end

	def link_lang(user)
		user.preferred_language == 'en' ? 'Link' : 'Lien'	
	end

	def location_lang(user)
		user.preferred_language == 'en' ? 'Location' : 'Location'	
	end

	def by_lang(user)
		user.preferred_language == 'en' ? 'by' : 'par'	
	end

end