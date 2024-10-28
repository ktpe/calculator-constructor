class Calculator < ApplicationRecord
  has_many :fields, dependent: :destroy
  has_many :formulas, dependent: :destroy
end
