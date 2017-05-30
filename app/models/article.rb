class Article < ApplicationRecord
  belongs_to :user
  has_many :readings
  has_many :comments, through: :readings

  validates :title, :content, presence: true
end
