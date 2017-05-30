class ChangeDefaultForLike < ActiveRecord::Migration[5.1]
  def change
    change_column :readings, :like, :boolean, :default => false
  end
end
