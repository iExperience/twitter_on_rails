class TweetsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  before_action :authenticate_admin!, :only => [:destroy]

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
    set_handles
  end

  def create
    @tweet = Tweet.new(tweet_params.merge({:user_id => current_user.id}))
    if @tweet.save
      redirect_to tweets_path
    else
      set_handles
      render :new
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    redirect_to tweets_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end

  def set_handles
    @handles = {}
    User.all.each { |user| @handles[user.handle] = user.id }
  end

end