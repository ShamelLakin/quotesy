class Api::V1::QuotesController < ApplicationController

    def index 
        quotes = Quote.all
        render json: quotes
    end 

    def create 
        quote = Quote.new(quote_params)
    end 

    private 
    
    def quote_params
    end 
end
