class RemoveAudioFileFromArticle < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :audio_file, :string
  end
end
