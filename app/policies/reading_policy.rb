class ReadingPolicy < ApplicationPolicy
  def like?
    # Anyone can view any article
    true
  end

 def unlike?
    # Anyone can view any article
    like?
  end

 def recommend?
    # Anyone can view any article
    true
  end

  def unrecommend?
    # Anyone can view any article
    recommend?
  end
end
