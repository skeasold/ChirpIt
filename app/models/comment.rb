class Comment < ActiveRecord::Base
  belongs_to :post
  validates :comment_content, :post_id, :user_id, presence: true
end
