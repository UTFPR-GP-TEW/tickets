class Project < ActiveRecord::Base
    has_secure_token
    validates_uniqueness_of :token
end
