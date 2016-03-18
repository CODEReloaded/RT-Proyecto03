class UserController < ApplicationController
	before_action :authenticate_user!
	def index
		@usuario = User.find(current_user.id)
		@posts = Post.all
	end

	def my_posts
		@posts = Post.where(user_id: current_user.id)
	end
end
