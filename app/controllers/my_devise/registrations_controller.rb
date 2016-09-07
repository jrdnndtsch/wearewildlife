class MyDevise::RegistrationsController < Devise::RegistrationsController
  
  def after_update_path_for(resource)
      admin_show_path
  end

end