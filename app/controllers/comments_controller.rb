class CommentsController < ApplicationController
  before_filter :authenticate_user!, :only=>[:create]
  def create
    @article=Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.author = current_user.username
    if @comment.save
      
    else
      @error="Please, type your message"

    end
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end

end
