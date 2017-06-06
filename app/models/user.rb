class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # author_followings: As an author to get all your followers you check
  # follower_followings:
  has_many :articles, dependent: :destroy
  has_many :readings, dependent: :destroy

  # I am the author and many people are following me
  has_many :author_followings, foreign_key: "author_id", class_name: "Following"

  # I am the follower of many authors
  has_many :follower_followings, foreign_key: "follower_id", class_name: "Following"


  def followers
    author_followings.map {|following| following.follower}
  end

  def followed_authors
    follower_followings.map {|following| following.author}
  end

  def followees
    followed_authors
  end


  validates :email, uniqueness: true
  mount_uploader :photo, PhotoUploader

end

