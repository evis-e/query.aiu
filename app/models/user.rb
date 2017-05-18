class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :answers, dependent: :destroy
  before_save { self.email = email.downcase }
  validates :username, presence: true, length: { maximum: 50 },
                       uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password

  def user_posts
    Post.where("user_id = ?", id)
  end

  def feed
    Post.where.not("user_id = ?", id)
  end

end
