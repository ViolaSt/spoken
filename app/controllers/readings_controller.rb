class ReadingsController < ApplicationController
  before_action :set_article, only: [:like, :unlike, :recommend, :unrecommend]
  before_action :set_reading, only: [:like, :unlike, :recommend, :unrecommend]

  def index
  end

  def like
    authorize @reading
    @reading.like = true
    @reading.save
    render :json => @reading
  end

  def unlike
    authorize @reading
    @reading.like = false
    @reading.save
    render :json => @reading
  end

  def recommend
    authorize @reading
    @reading.recommend!
    @reading.save
  end

  def unrecommend
    authorize @reading
    @reading.unrecommend!
    @reading.save
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

