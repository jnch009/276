class Search < ActiveRecord::Base
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    validates :user_id, presence: true
    validates :location, presence: true
    validates :slimit, numericality: {only_integer: true,greater_than_or_equal_to: 1,less_than_or_equal_to:20}
    validates :offset, presence: true
end
