class Article < ApplicationRecord
  belongs_to :user
  has_many :readings
  has_many :comments, through: :readings

  validates :title, :description, :date , :duration, :audio_file, :category , presence: true

  mount_uploader :photo, PhotoUploader

  # Gets a complete link from youtube(ex: "https://www.youtube.com/watch?v=O8EMo-_6ynI")
  # and strips it to only the provider ("YouTube") and the id ("O8EMo-_6ynI"), results in a Hash
  def parse_video_url(url)
    @url = url

    youtube_formats = [
      %r(https?://youtu\.be/(.+)),
      %r(https?://www\.youtube\.com/watch\?v=(.*?)(&|#|$)),
      %r(https?://www\.youtube\.com/embed/(.*?)(\?|$)),
      %r(https?://www\.youtube\.com/v/(.*?)(#|\?|$)),
      %r(https?://www\.youtube\.com/user/.*?#\w/\w/\w/\w/(.+)\b)
    ]

    vimeo_formats = [%r(https?://vimeo.com\/(\d+)), %r(https?:\/\/(www\.)?vimeo.com\/(\d+))]

    if @url
      @url.strip!

      if @url.include? "youtu"
        youtube_formats.find { |format| @url =~ format } and $1
        @results = {provider: "youtube", id: $1}
        @results
      elsif @url.include? "vimeo"
        vimeo_formats.find { |format| @url =~ format } and $1
        @results = {provider: "vimeo", id: $1}
        @results
      else
        return nil # There should probably be some error message here
      end
    end
  end

    # Extract only the video_id ("O8EMo-_6ynI") from the Hash result given by parse_video_url method
  def video_id
    # parse_video_url(audio_file)[:id]
  end
end
