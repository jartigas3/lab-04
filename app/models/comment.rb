class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post
    validates :post, presence: true

    has_rich_text :content

    validates :content, presence: true
    validates :author, presence: true
    validate :author_exists


  
    private
  
    def author_exists
      errors.add(:author, 'must be an existing user email') unless User.exists?(email: author)
    end
  end
  