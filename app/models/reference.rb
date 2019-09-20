class Reference < ApplicationRecord
  belongs_to :user
  has_many :definitions
end
