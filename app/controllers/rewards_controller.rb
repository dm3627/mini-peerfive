class RewardsController < ApplicationController
	before_action :find_user, only: [:index, :new, :create]

	def index
		@reward_histories = @user.reward_histories
	end

	def new
		@reward_histories = @user.reward_histories
		@p5_balance = 100 - @reward_histories.pluck(:points).sum
		@reward_history = @reward_histories.new
		@users = User.where.not(id: @user.id).order('name asc')
	end

	def create
		@reward_history = @user.reward_histories.new(given_to: params[:given_to], points: params[:points])
		@reward_history.save
	end

	private

	def find_user
		@user = User.find_by(id: params[:id])
	end
end
