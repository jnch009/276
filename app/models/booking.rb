class Booking < ActiveRecord::Base
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    #validates :user_id, presence: true
    validates :rdate, presence: true, uniqueness: true
    validate do |booking|
        if :rdate.blank?
        i = 0
        while i < Booking.pluck(:restaurant).count
           booking.errors.add_to_base("You have already booked a restaurant today") if Booking.pluck(:rdate)[i] == rdate.strftime("%Y-%m-%d")
        i+=1
        end
        end
    end
end
