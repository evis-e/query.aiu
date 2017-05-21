class Post < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :post_votes, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  def post_answers
    Answer.where("post_id = ?", id)
  end
end
