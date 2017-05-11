class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  before_save { self.email = email.downcase }
  validates :username, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password

  # Defines a proto-feed.
  # See "Following users" for the full implementation.
  def feed
    Post.where("user_id = ?", id)
  end

end
