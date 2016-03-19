class UserController < ApplicationController
	before_action :authenticate_user!

	# Método utilizado como inicio de sesion para no mostrar el id del usuario
	def index
		@usuario = User.find(current_user.id)
		@posts = Post.all
	end

	# Método para saber las publicaciones que ha hecho el usuario
	def my_posts
		@posts = Post.where(user_id: current_user.id)
	end
end
