class Bill < ActiveRecord::Base
  include Displayable

  belongs_to :job_order
  belongs_to :shipper, class_name: "Client"
  belongs_to :consignee, class_name: "Client"

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

  def shipper_name
    shipper.try :name
  end

  def consignee_name
    consignee.try :name_display
  end

  def shipper_name_display
    shipper.try(:name_display) || shipper_id_display
  end

  def consignee_name_display
    consignee.try(:name_display) || shipper_id_display
  end

  def arrival_date_display
    _arrival_date = arrival_date || estimated_arrival_date
    if _arrival_date.present?
      _arrival_date.strftime("%D")
    end
  end
end
