class Transaction < ApplicationRecord
  belongs_to :gl_account
  validates #TODO add validation
end
