class ReadingsController < ApplicationController
  before_action :set_article, only: [:like, :unlike, :recommend, :unrecommend]
  before_action :set_reading, only: [:like, :unlike, :recommend, :unrecommend]

  def index
  end

  def like
    authorize @reading # pundit authorization
    @reading.like = true
    @reading.save
    redirect_to @article
  end

  def unlike
    authorize @reading # pundit authorization
    @reading.like = false
    @reading.save
    redirect_to @article
  end

  def recommend
    authorize @reading  # pundit authorization
    @reading.recommend!(params[:reading][:recommendation_content])
    @reading.save
    redirect_to @article
  end

  def unrecommend
    authorize @reading # pundit authorization
    @reading.unrecommend!
    @reading.save
    redirect_to @article
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

