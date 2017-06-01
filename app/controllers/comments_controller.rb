class CommentsController < ApplicationController
  before_action :set_article, only: [:create, :update, :destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.reading = Reading.find(comment_params[:reading_id])
    @comment.reading.article = Article.find(params[:article_id])
    @comment.save
    @article = @comment.reading.article
    authorize @comment
    if @comment.save
      @reading = @comment.reading
     respond_to do |format|
        format.html { redirect_to article_path(@article) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
    end
    else
      respond_to do |format|
        format.html { render 'articles/show' }
        format.js  # <-- idem
      end
     end
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
