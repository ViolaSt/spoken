module ApplicationHelper
  def article_image_path(article)
    if article.photo?
      cl_image_path article.photo, height: 150
    else
      ""
    end
  end



  def user_image_path(user)
      cl_image_path user.photo, height: 150, width: 150, crop: "thumb", gravity: "face" || image_path("profile_avatar")
  end
end
