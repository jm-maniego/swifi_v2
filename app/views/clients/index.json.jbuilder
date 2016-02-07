json.array!(@clients) do |client|
  json.extract! client, :id, :name, :contact_person, :contact_number
  json.url client_url(client, format: :json)
end
