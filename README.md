### Setup
```
Ruby 2.4.1
Rails 5.1.3
bundle install
rake db:setup

Tests:
bundle exec rspec

```

### Example API Calls

```
rails s

1) Returns list of an models and models types
   curl http://localhost:3000/api/v1/models/serie_1/model_types -H 'Authorization: Token token="secret"'

2) Updates base_price and returns model_type's data
   curl -X POST -d "base_price=1000" http://localhost:3000/api/v1/models/serie_1/model_types_price/125i -H 'Authorization: Token token="secret"'
```
