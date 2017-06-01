class Following < ApplicationRecord
  belongs_to :author, foreign_key: "author_id", class_name: "User"
  belongs_to :follower, foreign_key: "follower_id", class_name: "User"

  # User instance can only follow/unfollow the author once
  validates :follower_id, uniqueness: { scope: :author_id }
end
