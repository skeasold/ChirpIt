class Post < ActiveRecord::Base
  validates :title, :content, presence: true
  paginates_per 25
  has_many :comments
  belongs_to :user
end
