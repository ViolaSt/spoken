json.extract! article, :id, :title, :description, :date, :duration, :audio_file, :category, :user_id, :created_at, :updated_at
json.url article_url(article, format: :json)
