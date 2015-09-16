class Chef < ActiveRecord::Base
  
  has_many :recipes
  
  validates :chefname, presence:true, length: { minimum:3, maximum:40 }
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i # Expresión regular para validar email
  validates :email, presence:true, length: { maximum:105 }, 
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }
                    
  before_save {
    self.email = email.downcase
  }
  
end