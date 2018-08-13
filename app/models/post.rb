class Post < ActiveRecord::Base
   validates :title, presence: true
    validates :content, presence: true, length: { minimum: 250 }
    validates :summary, presence: true, length: { maximum: 250 }
    validates :category, presence: true, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbaity?
    private

  def clickbaity?
    arr = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]

    is_clickbaity = arr.any? do |phrase|
      !!phrase.match(self.title)
      end

    if !is_clickbaity
      errors.add(:title, "not clickbaity enough!")
    end
  end

end
