class Bill < ActiveRecord::Base
  belongs_to :job_order

  ACCESSIBLE_ATTRIBUTES = [
    :consignee_id,
    :shipper_id,
    :reference_number,
    :master_reference_number,
    :description,
    :carrier_name,
    :quantity,
    :gross_weight,
    :chargeable_weight,
    :measurement,
    :registry_number,
    :port,
    :arrival_date,
    :estimated_arrival_date,
    :location,
    :carrier,
    :destination,
    :origin,
    :container_number,
    :invoice_number,
    :invoice_value
  ]
end
