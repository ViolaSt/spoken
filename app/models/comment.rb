class Comment < ApplicationRecord
  belongs_to :reading
  belongs_to :article, through: :readings, dependent: :destroy


  validates :title, :content , presence: true
  # validates :content, length: { minimum: 20 }
end
