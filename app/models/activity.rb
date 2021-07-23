class Activity < ActiveRecord::Base
    has_many :signups, dependent: :destroy
    has_many :campers, through: :signups
end
