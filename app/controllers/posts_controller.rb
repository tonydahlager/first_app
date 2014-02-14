class PostsController < ApplicationController
	# TD QUESTION 2/13/14
	# what properties or abilities do new controllers inhert from the ApplicationController and the ActionController?
	
	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post].permit(:title, :text))
		
		if @post.save
			redirect_to @post
		else 
			# TONY
			# what effect does this have?
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def index
		@posts = Post.all
	end

	private
		def post_params
			params.require(:post).permit(:title, :text)
		end

end

