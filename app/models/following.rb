class Following < ApplicationRecord
  belongs_to :author, foreign_key: "author_id", class_name: "User"
  belongs_to :follower, foreign_key: "follower_id", class_name: "User"
end
