class User < ActiveRecord::Base
    has_many :notes, dependent: :destroy
    has_secure_password
    
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, email: true
end