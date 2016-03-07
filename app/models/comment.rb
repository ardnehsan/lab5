class Comment < ActiveRecord::Base
  belongs_to :article
  validates :article, :comment_text, presence: true
end
