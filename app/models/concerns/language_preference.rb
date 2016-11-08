module LanguagePreference

	# Translation for Models
	def header_lang(user)
		user.preferred_language == 'en' ? 'Header' : 'En-tête'
	end

	def the_header_lang(user)
		user.preferred_language == 'en' ? 'Header' : "L'en-tête"
	end

	def calls_to_action_lang(user)
		user.preferred_language == 'en' ? 'Calls to Action' : 'Appels à l’action'
	end

	def list_calls_to_action_lang(user)
		user.preferred_language == 'en' ? 'Listing Calls to Action' : "Liste des appels à l'action"
	end

	def generic_stories_lang(user)
		user.preferred_language == 'en' ? 'Generic Stories' : 'Histoires génériques'
	end

	def all_generic_stories_lang(user)
		user.preferred_language == 'en' ? 'All Generic Stories' : 'Toutes les histoires génériques'
	end

	def menu_lang(user)
		user.preferred_language == 'en' ? 'Menu' : 'Menu'
	end

	def main_menu_lang(user)
		user.preferred_language == 'en' ? 'Main Menu' : 'menu principal'
	end

	def all_main_menus_lang(user)
		user.preferred_language == 'en' ? 'All Main Menu' : 'Éléments du menu principal'
	end

	def featured_member_lang(user)
		user.preferred_language == 'en' ? 'Featured Member' : 'En vedette'
	end

	def new_featured_member_lang(user)
		user.preferred_language == 'en' ? 'New Featured Member' : 'Nouvel élément en vedette'
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
		user.preferred_language == 'en' ? 'Recent Updates' : 'Mises à jour récentes'	
	end

	def all_lang(user)
		user.preferred_language == 'en' ? 'All' : 'Tout'
	end

	def title_lang(user)
		user.preferred_language == 'en' ? 'Title' : 'Titre'
	end

	def the_title_lang(user)
		user.preferred_language == 'en' ? 'Title' : 'le titre'
	end

	def featured_lang(user)
		user.preferred_language == 'en' ? 'Featured' : 'Présenté'
	end

	def selected_lang(user)
		user.preferred_language == 'en' ? 'Selected' : 'Sélectionné'
	end

	def approved_lang(user)
		user.preferred_language == 'en' ? 'Approved?' : 'Approuvé?'
	end

	def date_lang(user)
		user.preferred_language == 'en' ? 'Date' : 'Date'
	end

	def editing_lang(user)
		user.preferred_language == 'en' ? 'Editing' : 'Modifier'
	end

	def edit_lang(user)
		user.preferred_language == 'en' ? 'Edit' : 'Modifier'
	end

	def number_lang(user)
		user.preferred_language == 'en' ? 'Number' : 'Nombre'
	end

	def update_lang(user)
		user.preferred_language == 'en' ? 'Update' : 'Modifier'
	end

	def new_lang(user)
		user.preferred_language == 'en' ? 'New' : 'Nouveau'
	end

	def new_f_lang(user)
		user.preferred_language == 'en' ? 'New' : 'Nouvelle'
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

	def video_lang(user)
		user.preferred_language == 'en' ? 'video' : 'vidéo'	
	end

	def video_photo_lang(user)
		user.preferred_language == 'en' ? 'Video photo' : 'Photo de la vidéo'	
	end



end