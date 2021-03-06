class University < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
    validates :address, presence: true, length: { is: 5 } 
    
    scope :by_name, ->(university_name) { where(name: university_name) }    

    def average_score
        (reviews.collect { |review| review.score }.sum.to_f / reviews.size).round(2)
    end

    # def self.find_university(university_name)
    #     where(name: university_name)
    # end

    def self.top_three
        @universities = University.joins(:reviews).distinct.sort_by do |university|
            university.average_score
        end.reverse.first(3)
    end


    # def self.by_score
    #     @universities.sort! { |a,b| a.average_score <=> b.average_score}
    # end


end
