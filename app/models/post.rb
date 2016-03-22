class Post < ActiveRecord::Base
  validates :title, :content, presence: true
  paginates_per 2
  has_many :comments
  belongs_to :user
end
