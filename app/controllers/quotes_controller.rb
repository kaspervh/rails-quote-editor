class QuotesController < ApplicationController
  def index
    @quotes = Quote.all
  end

  def show
  end

  def new
    @quote = Quote.new
  end

  def Create
    @quote = Quote.new(quote_params)
    
    if @quote.save
      redirect_to quotes_path, notice: 'quote have been saved'
    else
      render :new
    end
  end

  def update
    if @quote.update(quotes_params)
      redirect_to quotes_path, notice: 'quote have been updated'
    else
      render :edit
    end
  end

  def destroy
    @quote.destroy
    redirect_to quote_path, notice: 'quote have been destroyed'
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:name)
  end
end
