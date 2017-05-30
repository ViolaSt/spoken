class Article < ApplicationRecord
  belongs_to :user

  validates :title, :description, :date , :duration, :audio_file, :category , presence: true

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

    # Extract only the video_id ("O8EMo-_6ynI") from the Hash result given by parse_video_url method
  def video_id
    parse_video_url(audio_file)[:id]
  end

  # def video_duration
  #   video = Yt::Video.new id: 'BPNYv0vd78A'
  #   video.duration
  # end
end
