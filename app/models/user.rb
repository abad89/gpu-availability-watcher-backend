class User < ApplicationRecord
    has_many :usergpus
    has_many :gpus, through: :usergpus
    has_secure_password
end
