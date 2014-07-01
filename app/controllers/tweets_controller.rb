class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
    set_handles
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to :action => :index  
    else
      set_handles
      render :new
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body, :user_id)
  end

  def set_handles
    @handles = {}
    User.all.each { |user| @handles[user.handle] = user.id }
  end
end