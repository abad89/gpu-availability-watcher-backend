class User < ApplicationRecord
    has_many :usergpus
    has_many :gpus, through: :usergpus
end
