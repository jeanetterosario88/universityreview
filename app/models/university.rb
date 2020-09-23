class University < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
    validates :address, presence: true, length: { is: 5 } 

    def average_score
        reviews.collect { |review| review.score }.sum.to_f / reviews.size
    end

    
    # def self.by_score
    #     @universities.sort! { |a,b| a.average_score <=> b.average_score}
    # end


end
