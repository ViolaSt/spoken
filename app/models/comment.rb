class Comment < ApplicationRecord
  belongs_to :reading

  validates :title, :content , presence: true
  validates :content, length: { minimum: 20 }
end
