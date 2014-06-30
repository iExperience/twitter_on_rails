class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
    @handles = {}
    User.all.each { |user| @handles[user.handle] = user.id }
  end
end