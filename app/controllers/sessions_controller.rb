class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(name: params[:name])
		if user and user.authenticate[:password]
			sessions[:user_id] = user.id
			redirect_to admin_url
    else
      redirect_to log_in_url, alert:'User or password is incorrect'
    end
	end

	def destroy
		#complete this method
	end
end
