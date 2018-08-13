class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum:250 }
  validates :summary, length: { maximum:250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait

  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def clickbait
    x = CLICKBAIT_PATTERNS.any? do |phrase|
      # binding.pry
      !!phrase.match(self.title)
      # self.title.include?(phrase)
    end
    if x == false
      errors.add(:title, "Not Clickbait-y")
    # binding.pry
    end
  end
end
