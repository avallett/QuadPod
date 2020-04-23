class User < ApplicationRecord
    has_many :articles
    
    VALID_EMAIL_REGEX = /A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    
    PASSWORD_FORMAT = /\A(?=.{6,})+(?=.*\d)+(?=.*[A-Z])/x   

    before_save { self.email = email.downcase }
    
    validates :name,
        presence: true,
        length: { maximum: 12 }
    
    validates :email,
        presence: true,
        length: { maximum: 255 },
        format: { with: VALID_EMAIL_REGEX },
        uniqueness: { case_sensitive: false }
        
    validates :password,
        presence: true,
        length: { minimum: 6 },
        format: { with: PASSWORD_FORMAT, message: " must contain a digit, uppercase letter and a lowercase letter" },
        on: :create
    has_secure_password
end
