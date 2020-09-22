class University < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    validates :name, presence: true, length: { minimum: 3 } 
    validates :address, presence: true, length: { is: 5 } 

    def average_score
        score_array = @university.reviews.collect do |review|
                        review.score
                      end
        score_sum = score_array.sum
        score_average = score_sum / score_array.size
    end

end
