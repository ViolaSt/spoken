class CommentsController < ApplicationController
  before_action :set_article, only: [:create, :update, :destroy]
  # before_action :check_if_user_has_name, only: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.reading = Reading.find(comment_params[:reading_id])
    @comment.reading.article = Article.find(params[:article_id])
    @comment.save
    @article = @comment.reading.article
    authorize @comment
    @reading = @comment.reading
    if @comment.save
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
    set_comment
    authorize @comment
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :content, :reading_id)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  # def check_if_user_has_name
  #   if current_user.first_name.nil?
  #     redirect_to edit_user_registration_path
  #   end
  # end
end
