class Category < ApplicationRecord
    link attempt: 
    belongs_to :category 

    has_many :tasks, dependent: :destroy

    validates :category_name, presence: true
    validates :details, presence: true
end
