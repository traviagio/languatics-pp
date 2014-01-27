class VotesController < ApplicationController


	def create
		@post = Post.find(params[:post_id])
		Vote.create(up: params[:up], post: @post)

		# WebsocketRails[:votes].trigger 'new', { id: @post.id, points: @post }
		WebsocketRails[:votes].trigger 'update_vote', { id: @post.id, points: @post.points }

		redirect_to '/posts'
	end
end
