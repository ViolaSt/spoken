class Reading < ApplicationRecord
  belongs_to :user
  belongs_to :article
  has_many :comments

  def recommend!(content = "")
    self.recommended = true
    self.recommendation_content = content
    self.save
  end

  def unrecommend!
    self.recommended = false
    self.recommendation_content = nil
    self.save
  end
end
