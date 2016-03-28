class Post < ActiveRecord::Base
  validates :title, presence: true
  # TODO: Add content back to validation after API assignment graded.
  paginates_per 25
  has_many :comments
  belongs_to :user
end
