class CommentsController < ApplicationController
  before_action :set_comment, only [:show, :create, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :content)
  end

  def set_comment
    @comment.article = Article.find(params[:article_id])
  end
end
