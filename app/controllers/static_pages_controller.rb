class StaticPagesController < ApplicationController
  def start
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed
    end
  end
end
