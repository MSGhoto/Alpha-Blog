class User < ApplicationRecord
    has_many :Articles #class_name: "object", foreign_key: "reference_id"
    validates :username,
        presence: true,
        uniqueness: { case_sensitive: false },
        length: {minimum:3, maximum:30}
        
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email,
        presence: true,
        uniqueness: { case_sensitive: false },
        length: {maximum:150},
        format: { with: VALID_EMAIL_REGEX }
end