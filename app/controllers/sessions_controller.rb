class SessionsController < ApplicationController
	def new
	end
	def create
		user = User.find_by email: session_params[:email]
		if authenticate(user.email, session_params[:password])
			sessions[:user_id] = user.id
			flash[:notice] = "Login complete"
			set_cookie
			redirect_to show
    else
      redirect_to root_path, alert:'User or password is incorrect'
    end
	end

	def destroy
		@_current_user = session[:current_user_id] = nil
		flash[:notice] = "You have successfully logged out."
		redirect_to root_url
	end
	def authenticate (user_email, password)
		user = User.find_by email:user_email
		if password == user.password
			return true
		else
			return false
		end
	end
	def set_cookie
		cookies.encrypted[:expiration_date] = Time.now + 40
	end
	def session_params
		params.require(:session).permit(:email, :password)
	end
end
