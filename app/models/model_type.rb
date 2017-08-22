class ModelType < ApplicationRecord
  belongs_to :model

  def total_price
  	model.organization.pricing_policy.constantize.new(base_price).total_price
  end

  def as_json
    super(only: [:name, :base_price], methods: [:total_price], root: true)
  end  
end
