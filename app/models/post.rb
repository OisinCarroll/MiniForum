class Post < ApplicationRecord

	has_many :comments, dependent: :destroy

	def create
		
	end

	#def destroy
	#	@post = Post.find(params[:post_id])
	#end
end
