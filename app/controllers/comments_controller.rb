class CommentsController < ApplicationController
  before_action :set_article, only: [:create, :update, :destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.reading = Reading.find(comment_params[:reading_id])
    @comment.reading.article = Article.find(params[:article_id])
    @comment.save
    @article = @comment.reading.article
    redirect_to @article
    authorize @comment
  end

  def update
    authorize @comment
  end

  def destroy
    authorize @comment
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :content, :reading_id)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
end
