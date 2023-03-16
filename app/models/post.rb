class Post < ApplicationRecord
    validate :title_clickbaity
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion:{in: %w(Fiction Non-Fiction)}

    def title_clickbaity
        if title.present? && !title.include?("Won't Believe") && !title.include?("Secret") && !title.match(/Top \d+/) && !title.include?("Guess")
          errors.add(:title, 'should be clickbait-y')
        end
      end
end
