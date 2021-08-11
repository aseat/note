class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
    @tweet = Tweet.includes(:user).order('created_at DESC')
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
    redirect_to tweets_path
    else
      render :new
    end
  end

  def edit
    unless @tweet.user.id == current_user.id
      @tweet = Tweet.create(tweet_params)
      if @tweet.save

        redirect_to root_path
      else
        render :edit
      end
    end
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweet_path
    else
      render :new
    end
  end

  def destroy
    if current_user.id == @tweet.user.id
      @tweet.destroy
      redirect_to tweets_path
    else
      render :new
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:title, :text, :image).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end