class CommentsController < ApplicationController
    def show
        @snapshot = Snapshot.find(params[:snapshot_id])
        @comment = @snapshot.comments.find(params[:id])
    end

      
    def create
      @snapshot = Snapshot.find(params[:snapshot_id])
      @comment = @snapshot.comments.build(comment_params)
      @comment.user = current_user
  
      if @comment.save
        redirect_back(fallback_location: root_url)
      else
        redirect_back(fallback_location: root_url)
      end
    end
  
    def update
      @comment = Comment.find(params[:id])
      if @comment.update(comment_params)
        redirect_to @comment.snapshot
      else
        render :edit
      end
    end
  
    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_back(fallback_location: root_url)
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end