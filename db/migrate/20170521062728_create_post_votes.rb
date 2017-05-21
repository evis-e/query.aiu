class CreatePostVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :post_votes do |t|
      t.integer :vote
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
    add_index :post_votes, [:post_id, :created_at]
    add_index :post_votes, [:user_id, :created_at]
  end
end
