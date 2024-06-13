class ForumController < ApplicationController
  def index
    if logged_in?
      @user = User.find_by(params[:id])
      @snapshot = current_user.snapshots.build if logged_in?
      @feed_items = Snapshot.all.order(created_at: :desc).paginate(page: params[:page])
    end
  end

end