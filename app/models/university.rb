class University < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    validates :name, presence: true, length: { minimum: 3 } 
    validates :address, presence: true, length: { minimum: 2 } 

end
