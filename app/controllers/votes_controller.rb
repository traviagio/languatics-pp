class VotesController < ApplicationController

	def create
		@post = Post.find(prarams[:post_id])
		Vote.create(up: params[:up], post: @post)

		redirect_to '/posts'
	end
end
