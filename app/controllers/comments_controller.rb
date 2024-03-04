class CommentsController < ApplicationController
	def new
		card = Card.find(params[:card_id])
		@comment = card.comments.build
	end

	def create
		card = Card.find(params[:card_id])
		@comment = card.comments.build(comment_params)
		if @comment.save
			redirect_to card_path(card), notice: 'Add a comment'
		else
			flash.now[:error] = 'Could not update.'
			render :new
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:content)
	end
end