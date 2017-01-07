class UsersController < ApplicationController

	before_action :set_user, only: [:edit, :update]

	def edit
	end

	def update
		if @user.update_attributes(user_params)
			flash[:success] = "Your user account was updated successfully!"
			redirect_to edit_user_registration_path
		else
			flash[:error] = "There was an error updating your account. Please try again."
			redirect_to edit_user_registration_path
		end
	end

private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:name)
	end	

end
