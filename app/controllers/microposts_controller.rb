class MicropostsController < ApplicationController
  before_filter :redirect_if_not_signed_in

  def create
    @micropost = current_user.microposts.build(params[:micropost])

    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy

  end
end