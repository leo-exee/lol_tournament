class User < ApplicationRecord
    has_secure_password
    
    before_save { self.email = email.downcase if email.present? }
    
    validates :email, presence: true, 
                      uniqueness: { case_sensitive: false }, 
                      length: { maximum: 105 },
                      format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
    
    def is_admin?
      self.is_admin
    end
  end