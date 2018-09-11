class PostsController < ApplicationController

	def index
		@posts = Post.all.order("created_at DESC").includes(:comments)
	end

	def new
		@post = Post.new
		@comment = Comment.new(post_id: params[:post_id])
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
		@posts = Post.all.includes(:comments)
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

	private 

	def post_params
		params.require(:post).permit(:title, :content)
	end 
end
