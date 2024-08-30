class Post < ApplicationRecord
    enum published: { unpublished: 0, published: 1 }
  
    validates :title, presence: true, length: { maximum: 100 }
    validates :content, presence: true, length: { minimum: 140 }
    validates :author, presence: true
    validate :author_exists
  
    private
  
    def author_exists
      errors.add(:author, 'must be an existing user email') unless User.exists?(email: author)
    end
  end
  