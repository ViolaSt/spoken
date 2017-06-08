class Comment < ApplicationRecord
  belongs_to :reading

  validates :content , presence: true
  validates :content, length: { minimum: 20 }
end
