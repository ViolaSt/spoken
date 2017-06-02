class FollowingsController < ApplicationController
  before_action :set_following, only: [:destroy]

  # User can follow an author
  def create
    following = Following.new(author_id: params[:user_id], follower_id: current_user.id)
    authorize following
    following.save
    if current_user.followers @user_id
      respond_to do |format|
        format.html { rediredirect_back(fallback_location: root_path) }
        format.js
      end
    end
  end

  # User can unfollow an author
  def destroy
    @following.destroy
    redirect_back(fallback_location: root_path)
    if current_user.followed_authors @user_id
      respond_to do |format|
        format.html { rediredirect_back(fallback_location: root_path) }
        format.js
      end
    end
  end

  private

  def set_following
    @following = Following.find_by(author_id: params[:user_id], follower_id: current_user.id)
    authorize @following
  end
end
