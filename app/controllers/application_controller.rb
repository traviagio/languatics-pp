class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



	def nag_for_email
		     if user_singed_in? && current_user.email.blank?
		flash[:error] = 'Please fill in your email'
				 end
	end

end
