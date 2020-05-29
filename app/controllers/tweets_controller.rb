class TweetsController < ApplicationController
  
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(9)
  end 
  
  def new
    @tweet = Tweet.new
  end 
  
  def create
    @tweet = Tweet.new(image: tweet_params[:image], product_name: tweet_params[:product_name], price: tweet_params[:price], sale: tweet_params[:sale], user_id: current_user.id)
    @tweet.save
  end 
  
  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.destroy
    end 
  end 
  
  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
  end 
  
  
  private
  def tweet_params
    params.require(:tweet).permit(:image, :product_name, :price, :sale)
  end 
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
