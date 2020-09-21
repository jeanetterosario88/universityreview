class Review < ApplicationRecord
    belongs_to :university
    belongs_to :user

    validates :title, presence: true, length: { minimum: 1 }
    validates :content, presence: true, length: { minimum: 6 }
    validates :score, presence: true, inclusion: { in: 1..10 }

end
