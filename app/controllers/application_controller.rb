class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  #  def after_sign_in_path_for(resource)
  #   session[:previous_url] || root_path
  # end



  # def configure_permitted_parameters
  #       devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :title, :company, :office_phone, :mobile_phone, :work_address, :city, :state, :zip, :website, :linkedin_profile_url)}
  #    #   :last_name,:company,:office_phone,:mobile_phone,:linkdin_profile_url,:profile_picture,:work_address,:name,:title,:secret_token,:admin )}
  #  # devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
  #   devise_parameter_sanitizer.for(:sign_in) { |u|      u.permit(:first_name, :last_name, :title, :company, :office_phone, :mobile_phone, :work_address, :city, :state, :zip, :website, :linkedin_profile_url) }

  #   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :title, :company, :office_phone, :mobile_phone, :work_address, :city, :state, :zip, :website, :linkedin_profile_url) }
  # end
def configure_permitted_parameters
devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password,) }
devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :title, :company, :office_phone, :mobile_phone, :work_address, :city, :state, :zip, :country_name, :website, :linkedin_profile_url) }
end


  def after_sign_in_path_for(resource)
    if current_user
      home_edit_path  
    else
      root_path
    end

    end
end
