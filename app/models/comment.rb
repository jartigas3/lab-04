class Comment < ApplicationRecord
    validates :content, presence: true
    validates :author, presence: true
    validate :author_exists
  
    private
  
    def author_exists
      errors.add(:author, 'must be an existing user email') unless User.exists?(email: author)
    end
  end
  