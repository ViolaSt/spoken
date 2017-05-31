class AddDetailsToReadings < ActiveRecord::Migration[5.1]
  def change
    change_column :readings, :like, :boolean, null: false, default: false
    change_column :readings, :recommended, :boolean, null: false, default: false
  end
end
