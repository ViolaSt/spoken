require 'open-uri'

class Article < ApplicationRecord
  belongs_to :user
  has_many :readings, dependent: :destroy
  has_many :comments, through: :readings, dependent: :destroy

  validates :title, :description, presence: true


  mount_uploader :photo, PhotoUploader
  mount_uploader :audio, AudioUploader

  def audio_public_id
    audio.instance_variable_get("@public_id")
  end

end
