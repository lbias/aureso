class Model < ApplicationRecord
  belongs_to :organization
  has_many :model_types

  def as_json
    super(include: {model_types: {only: [:name], methods: [:total_price]}}, only: [:name], root: false)
  end  
end
