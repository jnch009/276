class Review < ActiveRecord::Base
    belongs_to :user
    validates :body, presence: true, length: { maximum: 1000}
end
