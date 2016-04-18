class Project < ActiveRecord::Base
    has_secure_token
    has_many :tickets, dependent: :destroy
end
