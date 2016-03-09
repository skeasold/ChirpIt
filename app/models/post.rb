class Post < ActiveRecord::Base
  validates :title, :content, presence: true
  paginates_per 2
end
