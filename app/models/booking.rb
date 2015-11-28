class Booking < ActiveRecord::Base
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    validates :user_id, presence: true
    validates :Phone, presence: true, format: { with: /\d{3}\d{3}\d{4}/, message: "bad format" }
    validates :FirstName, presence: true
    validates :LastName, presence: true
end
