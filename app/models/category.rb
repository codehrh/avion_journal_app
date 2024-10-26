class Category < ApplicationRecord
    has_many :tasks

    validates :category_name, presence: true
    validates :details, presence: true
end
