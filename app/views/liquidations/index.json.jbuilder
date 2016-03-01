json.array!(@liquidations) do |liquidation|
  json.extract! liquidation, :id, :liquidated_by_name
  json.url liquidation_url(liquidation, format: :json)
end
