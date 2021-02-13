class Physician < ActiveRecord::Base
    has_many :appointments
    has_many :patients, through: :appointments
    has_secure_password
    # validations acitverecord or conditional logic (goes in controller)
end
