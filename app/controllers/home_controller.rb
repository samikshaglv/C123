class HomeController < ApplicationController

	layout "profile", :only => [ :profile]


	require 'csv'
  def index
  
  end

  def profile
  	
    @user = User.find_by_secret_token(params[:secret_token])
    if @user.present?


   
  render(:layout => "layouts/profile")
else
redirect_to  root_path

end
  end

  
  def edit

@user = current_user

  end


end
