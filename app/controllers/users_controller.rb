class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
        	redirect_to @user

		else
			render 'new'
		end
		
	end

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.digest(token)
		Digest::SHA1.hexigest(token.to_s)
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

		def create_remember_token
			self.remember_token = User.digest(User.new_remember_token)
		end



end