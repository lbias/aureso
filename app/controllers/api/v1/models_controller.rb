class Api::V1::ModelsController < ApplicationController
  def model_types
    models = Model.where(model_slug: params[:model_slug]).includes(:model_types)

    render json: {models: models.as_json}
  end

  def model_types_price
    model_type = ModelType.find_by(model_type_slug: params[:model_type_slug])

    if model_type
      model_type.update_attribute(:base_price, params[:base_price])
    end

    render json: model_type.as_json
  end
end
