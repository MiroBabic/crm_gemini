class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def can_use_seller
	if current_user.user_type == 'seller'
		redirect_to root_path, alert: 'Sem nemáš prístup'
	end
end	

def can_use_project_manager
	if current_user.user_type == 'project_manager'
		redirect_to root_path, alert: 'Sem nemáš prístup'
	end
end


end
