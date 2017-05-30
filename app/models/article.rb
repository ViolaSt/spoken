class Article < ApplicationRecord
  belongs_to :user

  validates :title, :description, presence: true
  mount_uploader :photo, PhotoUploader

end
