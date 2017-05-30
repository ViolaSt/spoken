class ReadingsController < ApplicationController


  def index
  end

  def like
    @article = Article.find(params[:article_id])
    # look up the reading based on the article and the user
    @reading = Reading.find_by(user: current_user, article: @article)
    # change the like attribute from true to false
    @reading.like = true
    @reading.save
  end

  def unlike
      @article = Article.find(params[:article_id])
    # look up the reading based on the article and the user
    @reading = Reading.find_by(user: current_user, article: @article)
    # change the like attribute from true to false
    @reading.like = false
    @reading.save
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
end

# like and recommended don't get assigned a reading
