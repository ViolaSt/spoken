class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # author_followings: As an author to get all your followers you check
  # follower_followings:
  has_many :author_followings, foreign_key: "author_id", class_name: "Following"
  has_many :follower_followings, foreign_key: "follower_id", class_name: "Following"


  def followers
    author_followings.map {|following| following.follower}
  end
  def followed_authors
    follower_followings.map {|following| following.author}
  end
  # possible improvement: has_many :followers, through: :author_followings

  validates :email, uniqueness: true
  mount_uploader :photo, PhotoUploader

end
