class Chef < ApplicationRecord
  before_save { self.email = email.downcase }

  validates :chefname, presence: true ,length: {maximum: 35}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #regular expression

  validates :email, presence: true, length: { maximum: 255 },
             format: { with: VALID_EMAIL_REGEX },
             uniqueness: { case_sensitive: false }


  has_many :recipes , dependent: :destroy #has_many for one-to-many..whereas dependant: :destroy will delete all the methoods which recipies has

  has_secure_password 
  validates :password ,presence: true ,length: {minimum: 5}, allow_nil: true #allow_nil: will allow the respected field to be blank after 1st iteration   
  #allow_nil is used to ensure that the respected field does not need to be added every time in UPdATE
end
