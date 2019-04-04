class CommentsController < ApplicationController

  def create
    comment = Comment.new
    comment.user_id = current_user.id
    comment.topic_id = params[:comment][:topic_id]
    comment.content = params[:comment][:content]


    if comment.save
      redirect_to topics_path, success: 'コメントしました'
    else
      redirect_to topics_path, danger: 'コメントに失敗しました'
    end
  end

end
