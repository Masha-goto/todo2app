class CardsController < ApplicationController
	before_action :set_card, only: [:show]
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

	def index
		@cards = Card.all
	end

	def show
	end

	def new
		@card = current_user.cards.build
	end

	def create
		@card = current_user.cards.build(card_params)
		if @card.save
			redirect_to card_path(@card), notice: 'Saved in.'
		else
			flash.now[:error] = 'Failed to save.'
			render :new
		end
	end

	def edit
		@card = current_user.cards.find(params[:id])
	end

	def update
		@card = current_user.cards.find(params[:id])
		if @card.update(card_params)
			redirect_to card_path(@card), notice: 'I was able to change it.'
		else
			flash.now[:error] = 'Could not change.'
			render :edit
		end
	end

	def destroy
		card = current_user.cards.find(params[:id])
		card.destroy!
		redirect_to cards_path, notice: 'Successfully deleted.'
	end

	private
	def card_params
		params.require(:card).permit(:name, :content, :limit_date, :eyecatch)
	end

	def set_card
    @card = Card.find(params[:id])
  end
end