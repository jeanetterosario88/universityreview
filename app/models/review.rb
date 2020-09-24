class Review < ApplicationRecord
    belongs_to :university
    belongs_to :user

    validates :title, presence: true, length: { minimum: 1 }
    validates :content, presence: true, length: { minimum: 6 }
    validates :score, presence: true, inclusion: { in: 1..10 }

    def self.by_university(university_id)
        where(university: university_id)
    end
    
end
