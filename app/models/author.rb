class Author < ActiveRecord::Base
    validates :name, {presence: true, uniqueness: true}

    validates :phone_number, format: { with: /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/}
end
