class AddAudioToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :audio, :string
  end
end
