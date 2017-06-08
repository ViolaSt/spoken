class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index

    if params[:query]
      @articles = policy_scope(Article).search_title_and_description(params[:query])
      if @articles.empty?
        "no articles match your search"
      end
    else
      @articles = policy_scope(Article)
    end
  end

  def show
    @reading = Reading.find_or_create_by(user: current_user, article: @article)
    @articles = Article.all
    @comment = Comment.new
  end

  def new
    @article = Article.new
    authorize @article
    @categories = ["Creativity", "Entrepreneurship", "Health", "Music", "Self", "Sex", "Sports", "Technology"]
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    authorize @article
    respond_to do |format|
      if @article.save
        format.html { redirect_to article_path(@article), notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_path(@article)}
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @article
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_article
      @article = Article.find(params[:id])
      authorize @article
    end

    def article_params
      params.require(:article).permit(:title, :description, :audio_file, :category, :user_id, :photo, :photo_cache, :audio, :audio_cache)
    end
end
