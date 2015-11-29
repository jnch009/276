class Booking < ActiveRecord::Base
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    validates :user_id, presence: true
    validates :rdate, presence: true, uniqueness: true
    #validate :correct_date
    #def correct_date
    #    return unless rdate.strftime('%Y') == '2015'
    #end
end
