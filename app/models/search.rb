class Search < ActiveRecord::Base
    #validates :restname, presence: true
    #validates :city, presence: true
    #validates :state, presence: true
    validate :at_least_one
    
    def at_least_one
         return unless restname.blank? && state.blank? && city.blank?
         errors.add(:base, 'WRONG') # you can add the error to the base or even a particular attribute.
    end
end
