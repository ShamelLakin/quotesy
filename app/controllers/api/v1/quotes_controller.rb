class Api::V1::QuotesController < ApplicationController

    def index 
        quotes = Quote.all
        render json: QuoteSerializer.new(quotes)
    end 

    def create 
        # binding.pry
        quote = Quote.new(quote_params)
        
        if quote.save
            render json: QuoteSerializer.new(quote), status: :accepted
        else
            render json: {errors: quote.errors.full_messages}, status: :unprocessible_entity
        end
    end 

    private 

    def quote_params
        params.require(:quote).permit(:quote, :author, :tag, :category_id)
    end 
end
