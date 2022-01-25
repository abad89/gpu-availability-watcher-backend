class User < ApplicationRecord
    validates :email, :password, presence: true
    validates :email, uniqueness: true
    validates :password, length: { minimum: 8}
    has_many :usergpus
    has_many :gpus, through: :usergpus
    has_secure_password
end
