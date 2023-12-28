class ApplicationController < ActionController::Base
# before_action :configure_sign_up_params, only: []
# before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_homes_top_path
    when Customer
      homes_top_path
    else
      homes_top_path
    end
  end
  
  def after_sign_out_path_for(resource)
    case resource
    when Admin
      new_admin_session_path
    when Customer
      homes_top_path
    else
      homes_top_path
    end
  end
  
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  # end
end
