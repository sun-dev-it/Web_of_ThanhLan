class SnapshotsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user, only: :destroy
    def create
        @snapshot = current_user.snapshots.build(snapshot_params)
        @snapshot.image.attach(params[:snapshot][:image])
        if @snapshot.save
            flash[:success] = "Đã đăng"
            redirect_back(fallback_location: root_url)
        else
            @feed_items = current_user.feed.paginate(page: params[:page])
            flash[:danger] = "Bài viết chưa có nội dung!"
            redirect_back(fallback_location: root_url)
        end
    end

    def destroy
        @snapshot.destroy
        flash[:success] = "Đã xóa bài viết"
        redirect_back(fallback_location: root_url)
    end

    private

    def snapshot_params
        params.require(:snapshot).permit(:content, :image)
    end

    def correct_user
        if current_user.admin?
            @snapshot = Snapshot.find_by(id: params[:id])
        else
            @snapshot = current_user.snapshots.find_by(id: params[:id])
            redirect_to root_url if @snapshot.nil?
        end
    end

end

