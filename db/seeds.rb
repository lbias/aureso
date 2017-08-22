organization = Organization.create(name: 'Aureso',
                                   public_name: 'Aureso',
                                   type: 'Service',
                                   pricing_policy: 'Fixed')

model_one = Model.create(organization: organization,
                         name: 'Series 1',
                         model_slug: 'serie_1')

model_two = Model.create(organization: organization,
                         name: 'Series 2',
                         model_slug: 'serie_2')

ModelType.create(name: 'bmw_125i',
                 model_type_slug: '125i',
                 model_type_code: 'BMW',
                 base_price: 1000,
                 model: model_one)

ModelType.create(name: 'bmw_330i',
                 model_type_slug: '330i',
                 model_type_code: 'BMW',
                 base_price: 5000,
                 model: model_two)
