class Model < ApplicationRecord
  belongs_to :organization
  has_many :model_types
end
