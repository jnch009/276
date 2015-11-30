class Search < ActiveRecord::Base
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    #validates :user_id, presence: true, if: :logged_in
    validates :location, presence: true
end
