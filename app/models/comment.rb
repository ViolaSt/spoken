class Comment < ApplicationRecord
  belongs_to :reading

  validates :title, :content , presence: true
end
