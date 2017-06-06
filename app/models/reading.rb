class Reading < ApplicationRecord
  belongs_to :user
  belongs_to :article
  has_many :comments

  def recommend!(content)
    self.recommended = true
    self.save
    self.recommendation_content = content
  end

  def unrecommend!
    self.recommended = false
    self.save
    self.recommendation_content = nil
  end
end
