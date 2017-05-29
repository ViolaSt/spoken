class Article < ApplicationRecord
  belongs_to :user

  validates :title, :description, :date , :duration, :audio_file, :category , presence: true
end
