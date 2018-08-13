class Post < ActiveRecord::Base
  include ActiveModel::Validations

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait_words

  def clickbait_words
    clickbait = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    included = false

    if self.title == nil
      return errors.add(:title, "Title can't be nil")
    end

    clickbait.each do |phrase|
      # binding.pry
      if self.title.include?(phrase)
        included = true
      end
    end

    if included == false
      errors.add(:title, "Title must have clickbait words")
    end
  end

end
