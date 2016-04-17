json.array!(@liquidation_form_lines) do |liquidation_form_line|
  json.extract! liquidation_form_line, :id, :name
  json.url liquidation_form_line_url(liquidation_form_line, format: :json)
end
