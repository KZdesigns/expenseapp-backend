class Transaction < ApplicationRecord
  belongs_to :gl_account
  validates :date, presence: true, format: { with: /\A[0-1][1-9]-[0-3][1-9]-[0-9][0-9][0-9][0-9]\z/ }
  validates :amount, presence: true
  validates :description, presence: true
  validates :gl_account, presence: true
end
