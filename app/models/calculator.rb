class Calculator < ApplicationRecord
  has_many :fields, dependent: :destroy
end
