class Project < ActiveRecord::Base
    has_secure_token

    has_many :tickets, dependent: :destroy

    validates :name, presence: true, length: {minimum: 5}
    validates :description, presence: true, length: {minimum: 5}
    validates_uniqueness_of :token

end
