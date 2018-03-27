class Chef < ApplicationRecord
  before_save { self.email = email.downcase }

  validates :chefname, presence: true ,length: {maximum: 35}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #regular expression

  validates :email, presence: true, length: { maximum: 255 },
             format: { with: VALID_EMAIL_REGEX },
             uniqueness: { case_sensitive: false }


  has_many :recipes

  has_secure_password 
  validates :password ,presence: true ,length: {minimum: 5}, allow_nil: true #allow_nil: will allow the respected field to be blank after 1st iteration   
end
