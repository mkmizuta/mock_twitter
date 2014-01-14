class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(params.require(:tweet).permit(:author, :body))
    if @tweet.save
      redirect_to "/tweets/#{@tweet.id}", notice: 'Tweet was successfully created.' 
    else
      render :new
    end
  end
end
