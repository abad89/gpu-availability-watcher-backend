class User < ApplicationRecord
    validates :email, presence: true, 'valid_email_2/email': true
    validates :email, uniqueness: true
    validates :password, presence: true
    validates :password, length: { minimum: 8}
    has_many :usergpus
    has_many :gpus, through: :usergpus
    has_secure_password
end
