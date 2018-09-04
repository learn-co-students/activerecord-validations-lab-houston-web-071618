require_relative './validator'

class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates :title, {presence: true}
    validates :content, {length: {minimum: 250}}
    validates :summary, {length: {maximum: 250}}
    validates :category, {inclusion: ["Fiction", "Non-Fiction"]}
    validates_with MyValidator

end
