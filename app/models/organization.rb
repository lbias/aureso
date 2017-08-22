class Organization < ApplicationRecord
  self.inheritance_column = nil

  has_many :models
end
