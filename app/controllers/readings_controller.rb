class ReadingsController < ApplicationController
before_action :set_article, only: [:like, :unlike, :recommend, :unrecommend]

  def index
  end

  def like
    @reading.like = true
    byebug
    @reading.save
    redirect_to @article
  end

  def unlike
    @reading.like = false
    @reading.save
    redirect_to @article
  end

  def recommend



  end

  def unrecommend
  end

  def update_recommendation
  end

  def update_recommendation
  end

  def destroy_recommendation
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_reading
    @reading = Reading.find_by(user: current_user, article: @article)
  end
end

