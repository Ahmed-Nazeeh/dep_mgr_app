class Like < ApplicationRecord
  belongs_to :comment
  belongs_to :user
  validates :user, uniqueness: { scope: :comment}
end
