class Article < ApplicationRecord
  belongs_to :user
  has_many: readings

  validates :title, :description, presence: true
end
