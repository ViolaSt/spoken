module ApplicationHelper
  def article_image_path(article)
    if article.photo?
      cl_image_path article.photo, height: 300, width: 700, crop: :fill
    else
      ""
    end
  end

  def user_image_path(user)
    if user.photo?
      cl_image_path user.photo, height: 40, width: 40, crop: "thumb", gravity: "face", radius: :max
    else
      "http://res.cloudinary.com/dijz3a59v/image/upload/h_40,r_max,w_40/v1496246486/profile_avatar_oma8an.png"
    end
  end

  def user_image_path_large(user)
    if user.photo?
      cl_image_path user.photo, height: 400, width: 400, crop: "thumb", gravity: "face", radius: :max
    else
      "http://res.cloudinary.com/dijz3a59v/image/upload/h_40,r_max,w_40/v1496246486/profile_avatar_oma8an.png"
    end
  end



  def avatar_image_path(user)
    if user.photo?
      cl_image_path user.photo, height: 30, width: 30, crop: "thumb", gravity: "face", radius: :max
    else
      "http://res.cloudinary.com/dijz3a59v/image/upload/h_40,r_max,w_40/v1496246486/profile_avatar_oma8an.png"
    end
  end

end
