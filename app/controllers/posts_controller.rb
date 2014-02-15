class PostsController < ApplicationController
	# TD QUESTION 2/13/14
	# what properties or abilities do new controllers inhert from the ApplicationController and the ActionController?
	
	def new
		# Post is the prototype that we want to load specific
		#   data from. We can load that data into a post instance
		#   which assigns data from the 
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post].permit(:title, :text))
		
		if @post.save
			redirect_to @post
		else 
			# TONY
			# what effect does this have?
			# 'render' means it will pass the @post object back into the 'new' template (ie new.html.erb) 
			#   so that you can resume editing the same params failed the data validation. It can do this
			#   because we are already in the Post controller
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def index
		@posts = Post.all
	end

	# Add edit action for update part of CRUD
	def edit
		# Locate post to update by :id
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(params[:post].permit(:title, :text))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

	private
		def post_params
			params.require(:post).permit(:title, :text)
		end
end

