class Calculator < ApplicationRecord
  has_many :fields, dependent: :destroy
  has_many :formulas, dependent: :destroy

  #чтобы можно было создавать связанные Field при создании Calculator
  accepts_nested_attributes_for :fields 
end
