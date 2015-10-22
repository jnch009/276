class Username < ActiveRecord::Base
    validates :first_name,:last_name,:email,:password_digest, presence: true
    has_secure_password
end
