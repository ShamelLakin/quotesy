class Api::V1::QuotesController < ApplicationController

    def index 
        quotes = Quote.all
        render json: quotes
    end 

    def create 
        quote = Quote.new(quote_params)
        if quote.save
            render json: quote, status: :accepted
        else
            renedr json: {errors: quote.errors.full_messages}, status: :unprocessible_entity
        end
    end 

    private 

    def quote_params
        params.requir(:quote).permit(:quote, :author, :tag, :category_id)
    end 
end
