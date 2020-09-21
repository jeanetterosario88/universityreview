class User < ApplicationRecord
  has_secure_password  
    
  has_many :reviews
  has_many :universities, through: :reviews

  validates :username, presence: true, length: { minimum: 6 }, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } #built in Ruby URI library 
  validates :password_digest, presence: true

end
