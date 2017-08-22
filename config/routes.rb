Rails.application.routes.draw do
  namespace :api, :defaults => { :format => :json } do
    namespace :v1 do
      get 'models/:model_slug/model_types' => 'models#model_types'
      post 'models/:model_slug/model_types_price/:model_type_slug' => 'models#model_types_price'
    end
  end
end
