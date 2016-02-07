json.array!(@job_orders) do |job_order|
  json.extract! job_order, :id, :client_id, :mode_of_shipment, :service_type, :services
  json.url job_order_url(job_order, format: :json)
end
