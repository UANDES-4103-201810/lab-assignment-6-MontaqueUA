class RegistrationsController < ApplicationController
	def new
	
	end

	def create
		user = User.new(registration_params)
		if user.save
			flash[:notice] = "Successfully created a user"
			redirect_to root_path
		else
			flash[:notice] = "Please fill in all textboxes"
			redirect_to registrations_path
		end
	end

	def registration_params
		params.require(:registrations).permit(:name, :last_name, :email, :password, :phone)
	end
end
