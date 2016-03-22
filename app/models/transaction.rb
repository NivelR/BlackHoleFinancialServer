class Transaction < ApplicationRecord
  validates :tag_id, :amount, :amount_type, :user_id, presence: true

  belongs_to :tag
  belongs_to :user
end
