json.array!(@liquidation_categories) do |liquidation_category|
  json.extract! liquidation_category, :id, :name, :default_flag
  json.url liquidation_category_url(liquidation_category, format: :json)
end
