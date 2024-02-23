class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :update_done, :update_not_done, :done_index]
    before_action :correct_user, only: [:update_done, :update_not_done, :update_share, :update_not_share]
  
    def create
      @micropost = current_user.microposts.build(micropost_params)
      if @micropost.save
        flash[:success] = "Micropost created!"
        redirect_to root_url
      else
        @feed_items = current_user.feed
        render 'static_pages/home', status: :unprocessable_entity
      end
    end

    def update_done
        @micropost.done = true
        if @micropost.save
          flash[:success] = "Micropost is done"
          redirect_to root_url, status: :see_other
        else
          redirect_to request.referrer, status: :see_other
        end
    end

    def update_not_done
        @micropost.done = false
        if @micropost.save
          flash[:success] = "Micropost is not done"
          redirect_to done_index_path, status: :see_other
        else
          redirect_to request.referrer, status: :see_other
        end
    end

    def update_share
        @micropost.shared = true
        if @micropost.save
          flash[:success] = "Micropost is shared"
          redirect_to root_url, status: :see_other
        else 
          redirect_to request.referrer, status: :see_other
        end
    end
        
    def update_not_share
        @micropost.shared = false
        if @micropost.save
          flash[:success] = "Micropost is not shared"
          redirect_to root_url, status: :see_other
        else
          redirect_to request.referrer, status: :see_other
        end
    end
  
    def done_index
       @done_feed_items = current_user.done_feed
    end
  
    private
  
      def micropost_params
        params.require(:micropost).permit(:content, :done, :shared)
      end

      def correct_user
        @micropost = Micropost.where(user_id: current_user.following_ids + [current_user.id])
                              .find_by(id: params[:id])
        redirect_to root_url, status: :see_other if @micropost.nil?
      end
end
  