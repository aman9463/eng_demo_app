class HomeController < ApplicationController

	def index
		if !user_signed_in?
			render :template => "users/sessions/new", :locals => {:resource => User.new, resource_name: :user}
			return
		end
		   @secret_codes = SecretCode.all
	end
end
