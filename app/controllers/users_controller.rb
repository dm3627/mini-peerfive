class UsersController < ApplicationController
	before_action :find_user, only: [:show, :edit, :update, :p5, :delete_p5, :rewards]
	before_action :find_reward_histories, only: [:p5, :rewards]

	def index
		@users = User.all.order('name asc')
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to users_path
		else
			@errors = @user.errors
			render :new, status: :unprocessable_entity
		end
	end

	def update
	  if @user.update(user_params)
	    redirect_to users_path
	  else
	  	@errors = @user.errors
	    render :edit, status: :unprocessable_entity
	  end
	end

	def p5
		
	end

	def delete_p5
		RewardHistory.find_by(id: params[:id]).destroy
		redirect_to p5_user_path(@user)
	end

	def rewards
	end

	private

	def user_params
		params.require(:user).permit(:name)
	end

	def find_user
		@user = User.find_by(id: params[:id])
	end

	def find_reward_histories
		@reward_histories = @user.reward_histories
	end
end
