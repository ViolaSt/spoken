class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.float :duration
      t.string :audio_file
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
