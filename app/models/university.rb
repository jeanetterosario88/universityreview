class University < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
    validates :address, presence: true, length: { is: 5 } 

    def average_score
        a = reviews.collect { |review| review.score }.sum.to_f / reviews.size
        a.round
    end

    def self.find_university(university_name)
        where(name: university_name)
    end
    
    # def self.by_score
    #     @universities.sort! { |a,b| a.average_score <=> b.average_score}
    # end


end
