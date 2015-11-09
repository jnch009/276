class Search < ActiveRecord::Base
    validates :restname, presence: true, length: { maximum: 50 }
    validates :state, presence: true, length: { maximum: 50 }
    validates :city, presence: true, length: { maximum: 50 }
end
