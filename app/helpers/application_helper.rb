module ApplicationHelper
  def article_image_path(article)
    if article.photo?
      cl_image_path article.photo, height: 150, width: 150, crop: :thumb
    else
      ""
    end
  end
end
