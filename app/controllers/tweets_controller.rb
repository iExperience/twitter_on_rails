class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
    @handles = {}
    User.all.each { |user| @handles[user.handle] = user.id }
  end

  def create
    # create a tweet
    Tweet.create(tweet_params)

    redirect_to :action => :index
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body, :user_id)
  end
end