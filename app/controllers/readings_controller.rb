class ReadingsController < ApplicationController
  before_action :set_article, only: [:like, :unlike, :recommend, :unrecommend]
  before_action :set_reading, only: [:like, :unlike, :recommend, :unrecommend]

  def index
  end

  def like
    @reading.like = true
    authorize @reading
    @reading.save
    redirect_to @article
  end

  def unlike
    @reading.like = false
    authorize @reading
    @reading.save
    redirect_to @article
  end

  def recommend
    @reading.recommended = true
    authorize @reading
    @reading.save
    redirect_to @article
  end

  def unrecommend
    @reading.recommended = false
    authorize @reading
    @reading.save
    redirect_to @article
  end

  def update_recommendation
  end

  def destroy_recommendation
  end

  # @dan: Added this line to make methods private and prevent injections
  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_reading
    @reading = Reading.find_by(user: current_user, article: @article)
  end
end

